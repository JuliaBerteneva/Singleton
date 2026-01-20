# Singleton Pattern in ABAP – Practical Examples & Testing

This repository accompanies the blog post

**“Singleton Pattern in ABAP: Useful Tool or Interview Trap?”**

It contains **practical ABAP examples** showing:

- when Singleton **does make sense** in real ABAP systems
- how to implement it **correctly**
- how to **test** Singleton-based code
- how to **avoid common pitfalls**, especially regarding testability

The goal is not to promote Singleton as a default solution, but to show **intentional, controlled usage** in realistic scenarios.

---

## Repository Structure

The repository contains several focused examples:

### 1. `ZUL_CL_APP_BUFFER` – Singleton Implementation

A simple but realistic Singleton example representing:

- a runtime buffer
- a message container
- a shared state holder during an internal session

Key characteristics:

- controlled instantiation via `CREATE PRIVATE`
- public static factory method `GET_INSTANCE`
- encapsulated runtime state
- behavior exposed via an interface

This example demonstrates **why and how Singleton can be justified** in ABAP.

### 2. `ZUL_CL_APPLICATION1 and ZUL_CL_APPLICATION2` – Depend on Singleton

Usage is the same exept the Dependency Injection part. Check 

---

### 3. Unit Tests

The repository contains ABAP Unit tests that demonstrate:

- verifying Singleton behavior (same instance, shared state)
- mocking Singleton dependencies via interfaces (in ZUL_CL_APPLICATION1)
- injecting test doubles via local friends (in ZUL_CL_APPLICATION2)

---

## Key Takeaways

- Singleton solves **state consistency**, not convenience
- In ABAP, Singleton is mostly justified for:
    - runtime buffers
    - configuration readers
    - shared technical services
- Testability depends on:
    - interface-based design
    - controlled dependency handling
- Blind usage of Singleton leads to:
    - hidden global state
    - fragile tests
    - hard-to-maintain code

---

## Related Blog Post

If you’re interested in the full explanation and background, see the blog post:

**Singleton Pattern in ABAP: Useful Tool or Interview Trap?**

👉 (https://julialopina.com/singleton)
