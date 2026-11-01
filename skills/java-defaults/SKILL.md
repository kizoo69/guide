---
name: java-defaults
description: >
  Core defaults and conventions for Java projects. Covers Java 21 LTS,
  Maven build, Google Java Style, standard dependencies (Lombok, SLF4J,
  Jackson, Commons, Guava), and test-first practices (JUnit 5, Mockito).
  Use when creating, configuring, or reviewing Java projects and code.
---

# Java Project Defaults

## Core
- **Java version**: 21 (LTS)
- **Build**: Maven
- **Code style**: Google Java Style

## Dependencies
- **Boilerplate**: Lombok (use all annotations where appropriate)
- **Logging**: SLF4J + Logback
- **JSON**: Jackson
- **Strings**: Apache Commons Lang (StringUtils for null safety)
- **I/O**: Apache Commons IO
- **Collections**: Guava, Apache Commons Collections
- **Recommend libraries**: Suggest pragmatic libs when beneficial

## Testing
- **Approach**: Test-first programming (TDD)
- **Framework**: JUnit 5 (Jupiter)
- **Mocking**: Mockito
- **Assertions**: Plain JUnit assertions
