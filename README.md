# Task Manager CLI (Dart)

A command-line task management application built entirely with Dart, designed to demonstrate advanced object-oriented programming concepts and software architecture principles.

---

## Purpose of the Project

This project was developed to practice and demonstrate:

- Clean architecture in Dart applications
- Object-oriented programming principles
- Generic programming
- Dependency injection
- File persistence with JSON
- Unit testing strategy

---

## Features

The application supports the following features:

- Create tasks with title, priority, and optional due date
- Support for multiple task types (BasicTask and UrgentTask)
- Mark tasks as completed
- Delete tasks
- List and sort tasks by priority or date
- Persistent storage using JSON file
- Structured error handling using custom exceptions

---

## Architecture Overview

The project follows a layered architecture:
CLI Layer (Menu)
↓
Service Layer (TaskService)
↓
Repository Layer (Repository<T>)
↓
Concrete Repository (TaskRepository)
↓
Persistence Layer (JsonService)
↓
Local Storage (tasks.json)

Each layer has a single responsibility to ensure maintainability and scalability.

---

## Object-Oriented Design

### Abstract Class

The `Task` class is abstract and defines the base structure for all tasks.

It enforces shared behavior such as:

- id
- title
- priority
- completion state

---

### Inheritance

Two implementations extend Task:

- `BasicTask` → standard task
- `UrgentTask` → task with enforced high priority

This demonstrates inheritance and specialization.

---

### Why BasicTask and UrgentTask?

- BasicTask represents general user-defined tasks
- UrgentTask enforces business rule: priority is always HIGH

This avoids invalid state and ensures data consistency.

---

## Generics Usage

The project uses generics in the repository pattern:

Repository<T>

This allows the repository to be reusable for any data type, improving scalability and flexibility.

---

## Custom Exceptions

Custom exception `TaskException` is used to:

- Handle missing tasks
- Manage invalid operations
- Improve error clarity for CLI users

---

## Persistence

Tasks are stored locally in:
data/tasks.json


The system automatically:

- Loads tasks at startup
- Saves tasks after every modification

---

## Testing Strategy

The project includes unit tests covering:

- Task model creation
- Task completion logic
- Repository operations (add/remove/find)
- Service layer business logic
- Sorting operations
- Exception handling

Tests are isolated using a fake repository to ensure proper unit testing.

---

## Running the Project

Install dependencies:

```bash
dart pub get
Run the application:
dart run
Run tests:
dart test
Analyze code:
dart analyze

Project Structure
lib/
 ├── enums/
 ├── exceptions/
 ├── interfaces/
 ├── models/
 ├── repositories/
 ├── services/
 └── utils/

test/
data/
Author

Developed by CodeAsGod_dev