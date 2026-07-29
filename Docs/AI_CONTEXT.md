# DineFlow AI Context

## Purpose

This document provides the current development status of DineFlow.

Unlike the roadmap, this file describes the project's **current implementation state**.

AI assistants should read this document before implementing new features.

---

# Current Status

Project Phase:

Active Development

Application Status:

Functional Prototype

Architecture Status:

Stable

---

# Completed Features

## Restaurant

- Table Management
- Guest Count
- Table Status Management

---

## Orders

- Create Orders
- Update Orders
- Order Summary
- Running Totals
- GST Calculation
- Grand Total Calculation

---

## Kitchen

- Kitchen Dashboard
- Kitchen Order Tickets
- Multiple KOT Support
- Ready Workflow

---

## Billing

- Billing Screen
- Payment Methods
- Complete Payment
- Table Reset

---

## Design System

Completed

Includes:

- AppSpacing
- AppTypography
- AppRadius
- AppColor
- Shared Components

---

# Current Architecture

Current architecture is considered stable.

Major components:

- RestaurantStore
- Feature-first folder structure
- Observation Framework
- SwiftUI
- Offline-first workflow

Avoid unnecessary architectural rewrites.

---

# Current Business Rules

Current workflow:

Available

↓

Guest Count

↓

Ordering

↓

Kitchen

↓

Ready

↓

Serve Food

↓

Billing

↓

Payment

↓

Available

This workflow should remain unchanged unless explicitly requested.

---

# Multiple Kitchen Ticket Rules

Implemented.

Rules:

- Pending items create new KOTs.
- Sent items cannot be modified.
- Kitchen receives only pending items.
- Tables become Ready only after every active ticket is Ready.

---

# Current Technical Debt

Known areas for future improvement:

- RestaurantStore is growing in size.
- Persistence has not been implemented.
- Dashboard requires historical order data.
- Receipt generation is pending.

These items are expected and should not trigger unnecessary refactoring.

---

# Current Priority

Highest Priority:

CompletedOrder

Purpose:

Store completed sales before resetting restaurant data.

Dashboard development depends on this feature.

---

# Upcoming Features

Next planned order:

1. CompletedOrder
2. Dashboard
3. Receipt Generation
4. SwiftData Persistence
5. Reports
6. Analytics

Implement features in this sequence unless instructed otherwise.

---

# Do Not Change

Without approval, do not change:

- Folder structure
- Restaurant workflow
- Multiple KOT behavior
- Billing workflow
- Design system
- Core architecture

---

# AI Expectations

Before implementing code:

1. Read AGENTS.md.
2. Read PRODUCT.md.
3. Read Architecture.md.
4. Read this file.

Then:

- Inspect the existing implementation.
- Preserve current behavior.
- Reuse existing patterns.
- Implement only the requested feature.

Do not rewrite unrelated code.
