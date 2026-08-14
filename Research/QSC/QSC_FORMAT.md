# QSC Format - Consolidated Reference

Auto-generated consolidation of 2 research files.

---

## QSC_FORMAT.md

**Extension:** `.qsc`
**Container:** None (plain text)

QSC files contain the source-level scripting language for IGI's game logic. Unlike QVM (compiled bytecode), QSC is human-readable and uses a function-call syntax.

## 8.1 Syntax

QSC is a semicolon-terminated, function-call-based language:

```
FunctionName(arg1, arg2, NestedFunc(innerArg), "string arg");
```

**Argument types:**
- **String:** Enclosed in double quotes (`"hello"`). Supports `\"` escape sequences.
- **Number:** Integer or floating-point (e.g., `42`, `-3.14`, `1e5`).
- **Boolean:** `TRUE` or `FALSE` (case-sensitive).
- **Function:** Nested function calls act as arguments (evaluated recursively).

## 8.2 Structure

A QSC file consists of a sequence of top-level function calls separated by semicolons:

```
Task(1, "patrol",
    StatusText(1, "Guard patrolling"),
    AIGraph(1, "patrol_route_01"),
    Loop(3,
        Goto(100.0, 200.0, 50.0),
        Wait(5.0)
    )
);
```

## 8.3 Parser Limits

| Constant       | Value  | Description                         |
|----------------|--------|-------------------------------------|
| MAX_QSC_FUNCS  | 4096   | Maximum function nodes              |
| MAX_QSC_ARGS   | 65536  | Maximum argument nodes              |

---

