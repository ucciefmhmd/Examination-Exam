# Examination System Database (SQL Server)

A **SQL Server** database for an online examination system covering branches, intakes, courses, instructors, students, question pools, exams and **automatic grading**. The business logic lives in the database as stored procedures, functions, triggers and views, and access is separated by role. It was built as a team project during training.

## My role

As listed in the team's own breakdown (`12- Documentation/Team Member.pdf`), I:

* shared in designing the database and implementing its SQL;
* developed the **training-manager stored procedures**: create, edit and delete for branches, courses, instructors and students, assigning instructors to courses, and intakes per department;
* developed the **training-manager views**: `ShowAllDataFromBranch`, `ShowAllDataFromCourses`, `ShowAllDataFromInstaructors`, `ShowAllDataFromStudent`, `ShowDepartmentInIntake` and `ShowInstructorInCourseAndClass`;
* worked on the performance of the manager-facing queries, and on testing the manager functionality;
* shared in leading the data collection, and in creating the ERD and table mapping.

## Roles and what each can do

| Role (SQL login) | Through |
|---|---|
| **Training manager** | Procedures to create and edit branches, intakes, courses, instructors and students, and to assign instructors to courses. Views over all of that data. |
| **Instructor** | Procedures to create questions, build exams (pick questions manually or **randomly** from the pool), set question marks, and assign students to exams. Views of exams, question pools and students per class. |
| **Student** | Procedures to list available exams and submit answers. A view of their own results. |

## How grading works

1. A student's answers are stored with `Add student answer`.
2. `CalculateTotalCorrectAnswers` (a function) scores an exam attempt.
3. `UpdateResultsTrigger` re-scores the student in `Student_Exam` whenever answers are inserted, changed or deleted, and the `Update student exam result` procedure re-scores one student on demand. Students read their results through `ShowStudentResults`.

## What's inside

| Folder | Contents |
|---|---|
| `1- Create Database`, `2- Create Tables` | Database and schema scripts |
| `3- Insert Data` | Seed data (anonymised: `example.com` emails, placeholder passwords) |
| `4- Views`, `5- Indexs` | Views per role, and indexes |
| `6- Procedure`, `7- Functions`, `8- Triggers` | Business logic, grouped by role |
| `9- Accounts`, `Roles.sql` | Logins and users; database roles and their permissions |
| `10- Test Query` | Test queries per role, and `VerifyFixes.sql` |
| `12- Documentation` | ERD, table mapping, the project requirements sheet and the team breakdown |

## ERD

![ERD](12-%20Documentation/ERD.jpeg)

## Running it

The database is built entirely from the scripts in this repository. You need SQL Server 2019 or later (Express, Developer or LocalDB) and `sqlcmd`.

Run the scripts in this order on an instance that doesn't have an `Examination` database yet:

| Step | Script | Connected to |
|---|---|---|
| 1 | `1- Create Database/Create Database.sql` | `master` |
| 2 | `2- Create Tables/CreateTables.sql` (tables, constraints and the `InstructorSC`, `MangerSC`, `StudentSC` schemas) | `Examination` |
| 3 | `3- Insert Data/InsertAllDataToTables.sql` | `Examination` |
| 4 | every `.sql` file in `4- Views` | `Examination` |
| 5 | every `.sql` file in `5- Indexs` | `Examination` |
| 6 | every `.sql` file in `6- Procedure` | `Examination` |
| 7 | every `.sql` file in `7- Functions` | `Examination` |
| 8 | `8- Triggers/UpdateResultsTrigger.sql` | `Examination` |
| 9 | `9- Accounts/Accounts.sql` (needs the three passwords, see below) | `Examination` |
| 10 | `Roles.sql` | `Examination` |

Steps 2 to 10 run in whichever database you're connected to: pass `-d Examination` to `sqlcmd`, or pick `Examination` in the SSMS database list. They stop with an error if you're connected to a system database such as `master`.

The whole build with `sqlcmd` from PowerShell, in the repository folder:

```powershell
$server = "(localdb)\MSSQLLocalDB"   # or ".", ".\SQLEXPRESS", ...
$db     = "Examination"

# 1. create the database
sqlcmd -S $server -d master -I -b -i "1- Create Database/Create Database.sql"

# 2-8. tables, seed data, views, indexes, procedures, functions, trigger
$scripts = @("2- Create Tables/CreateTables.sql", "3- Insert Data/InsertAllDataToTables.sql")
foreach ($folder in "4- Views", "5- Indexs", "6- Procedure", "7- Functions", "8- Triggers") {
    $scripts += Get-ChildItem $folder -Recurse -Filter *.sql | Sort-Object FullName | ForEach-Object FullName
}
foreach ($file in $scripts) {
    sqlcmd -S $server -d $db -I -b -i $file
    if ($LASTEXITCODE -ne 0) { throw "Failed: $file" }
}

# 9-10. logins and users, then roles and permissions
sqlcmd -S $server -d $db -I -b -i "9- Accounts/Accounts.sql" `
  -v ManagerPassword="<strong password>" InstructorPassword="<strong password>" StudentPassword="<strong password>"
sqlcmd -S $server -d $db -I -b -i "Roles.sql"
```

`-b` makes `sqlcmd` stop with a non-zero exit code on the first error, and `-I` turns on quoted identifiers, as SSMS does.

`9- Accounts/Accounts.sql` creates the `manager`, `instructor` and `student` logins and their database users, skipping any that already exist. It doesn't contain passwords; you supply them when you run it, as above. In SSMS, enable **Query → SQLCMD Mode** and add `:setvar ManagerPassword "..."` lines (and the other two) at the top.

The scripts build from empty. To rebuild, drop the `Examination` database first (the logins are kept and reused).

Exam dates in the seed data are set relative to the day you run step 3 (1 to 53 days ahead), because the `Exam_check_date` constraint rejects past dates.

## Testing it

After the build, run the test queries in this order, connected to `Examination`:

```powershell
sqlcmd -S $server -d $db -I -b -i "10- Test Query/ExecuteByManager.sql"
sqlcmd -S $server -d $db -I -b -i "10- Test Query/ExecuteByInstructor.sql"
sqlcmd -S $server -d $db -I -b -i "10- Test Query/ExecuteByStudent.sql"
sqlcmd -S $server -d $db -I -b -i "10- Test Query/VerifyFixes.sql"
```

The three `ExecuteBy...` scripts call each role's views and procedures with IDs from the seed data, and change data as they go. A student can only answer while an exam is running, so on a freshly built database the answers in `ExecuteByStudent.sql` are refused with "This exam is not currently available for answering."

`VerifyFixes.sql` checks that the trigger scores every student in multi-row inserts, updates and deletes, that `CalculateTotalCorrectAnswers` returns 0 rather than NULL, that the random question picker adds exactly the requested number of questions, and that an error inside a procedure reaches the caller and rolls the work back. It prints PASS or FAIL per check, fails if any check fails, and rolls back its own test data, so it can be run repeatedly.

## Notes

* The procedures report problems by raising errors, not by printing them, and run their writes in a transaction that is rolled back on any error. Their own errors use the original messages with these numbers: 50001 (row not found), 50002 (a count doesn't match the list passed), 50003 (not allowed, for example an instructor who doesn't teach the course, or an exam that isn't running).
* `InsertExamQuestionsRandomly` raises error 50003 and adds nothing if you ask for more questions than the course has left for that exam.
* The seed data is fictional. Its `*_password` columns store plain text because that's how the original schema was designed. A production system would store salted hashes, or use SQL or Entra ID authentication only.
