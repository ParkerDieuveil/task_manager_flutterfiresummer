# Task Manager CLI

A command-line task management application built entirely with Dart.

## Features

- Add a task
- Delete a task
- Mark a task as completed
- Display all tasks
- Sort tasks by priority
- Sort tasks by due date
- Persist tasks in a local JSON file
- Robust error handling with custom exceptions

## Architecture

The application follows a layered architecture.

```
Menu (CLI)
      │
TaskService
      │
Repository<Task>
      │
TaskRepository
      │
JsonService
      │
tasks.json
```

## Dart Concepts Used

This project demonstrates several advanced Dart concepts:

- Abstract classes
- Inheritance
- Interfaces
- Generic Repository Pattern
- Enums
- Custom Exceptions
- JSON Serialization
- Dependency Injection
- Unit Testing

## Running

Install dependencies:

```bash
dart pub get
```

Run the application:

```bash
dart run
```

Run the tests:

```bash
dart test
```

Analyze the project:

```bash
dart analyze
```

## Project Structure

```
lib/
 ├── enums
 ├── exceptions
 ├── interfaces
 ├── models
 ├── repositories
 ├── services
 └── utils
```

## Tests

The project contains multiple unit tests covering:

- Model creation
- Repository
- Task Service
- Sorting
- Exceptions
- Task completion
- Task deletion

## Author

Developed by CodeAsGod_dev.