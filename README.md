# Examination System Database (SQL Server)

A **SQL Server** database for an online examination system covering branches, intakes, courses, instructors, students, question pools, exams and **automatic grading**. The business logic lives in the database as stored procedures, functions, triggers and views, and access is separated by role. It was built as a team project during training.

<!-- TODO(Youssef): confirm which parts you built yourself before adding a "My role" section. -->

## Roles and what each can do

| Role (SQL login) | Through |
|---|---|
| **Training manager** | Procedures to create and edit branches, intakes, courses, instructors and students, and to assign instructors to courses. Views over all of that data. |
| **Instructor** | Procedures to create questions, build exams (pick questions manually or **randomly** from the pool), set question marks, and assign students to exams. Views of exams, question pools and students per class. |
| **Student** | Procedures to list available exams and submit answers. A view of their own results. |

## How grading works

1. A student's answers are stored with `Add student answer`.
2. `CalculateTotalCorrectAnswers` (a function) scores an exam attempt.
3. `UpdateResultsTrigger` and the `Update student exam result` procedure keep the results up to date, and students read them through `ShowStudentResults`.

## What's inside

| Folder | Contents |
|---|---|
| `1- Create Database`, `2- Create Tables` | Database and schema scripts |
| `3- Insert Data` | Seed data (anonymised: `example.com` emails, placeholder passwords) |
| `4- Views`, `5- Indexs` | Views per role, and indexes |
| `6- Procedure`, `7- Functions`, `8- Triggers` | Business logic, grouped by role |
| `9- Accounts` | Logins, users and role permissions |
| `10- Test Query`, `11- Backup` | Test queries per role, and backup scripts |
| `12- Documentation` | ERD, table mapping and script documentation |

## ERD

![ERD](12-%20Documentation/ERD.jpeg)

## Running it

Run the scripts in folder order (1 → 9) on SQL Server 2019 or later.

`9- Accounts/Accounts.sql` creates the `manager`, `instructor` and `student` logins. It doesn't contain passwords; you supply them when you run it:

```bash
sqlcmd -S . -i "9- Accounts/Accounts.sql" \
  -v ManagerPassword="<strong password>" InstructorPassword="<strong password>" StudentPassword="<strong password>"
```

In SSMS, enable **Query → SQLCMD Mode** and add `:setvar ManagerPassword "..."` lines (and the other two) at the top.

## Notes

* The seed data is fictional. Its `*_password` columns store plain text because that's how the original schema was designed. A production system would store salted hashes, or use SQL or Entra ID authentication only.
