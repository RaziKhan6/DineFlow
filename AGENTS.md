# DineFlow - AI Development Guide

## About the Project

DineFlow is an offline-first restaurant POS system built entirely in SwiftUI.

Target Platforms:
- iPhone
- iPad

Tech Stack:
- SwiftUI
- Observation Framework
- Xcode
- Swift 6
- No UIKit
- No Combine unless absolutely necessary

---

# Architecture

The project follows a feature-based architecture.

Current folders:

- App
- Core
- Features
- Resources
- SampleData

Each feature contains:

- Models
- ViewModels
- Views
- Components
- Data (if needed)

Do not create random folders.

---

# Business Logic

RestaurantStore owns business logic.

Views should remain declarative.

Never duplicate business logic inside Views.

Prefer computed properties.

---

# Coding Style

Always:

- Use MARK comments.
- Keep Views under ~150 lines when possible.
- Extract reusable components.
- Prefer private helper methods.
- Avoid duplicate code.
- Avoid force unwraps.
- Use descriptive naming.

---

# Design System

Always use:

AppSpacing

AppRadius

AppTypography

AppColor

StatusBadge

Never hardcode spacing, fonts or colors.

---

# SwiftUI Guidelines

Prefer:

@Observable

@Bindable

NavigationStack

safeAreaInset()

Do not introduce UIKit unless requested.

Avoid GeometryReader unless necessary.

Avoid AnyView.

Generate Preview for every View.

---

# Folder Rules

New screens belong inside:

Features/<Feature>/Views

Reusable UI belongs inside:

Features/<Feature>/Components

Business models belong inside:

Features/<Feature>/Models

ViewModels belong inside:

Features/<Feature>/ViewModels

---

# Workflow

Restaurant Workflow

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

Never modify this workflow without explicit instruction.

---

# Kitchen Rules

Support multiple KOTs.

Each OrderItem tracks:

isSentToKitchen

Pending items create new Kitchen Tickets.

Already sent items cannot be modified.

Table becomes Ready only when every Kitchen Ticket is Ready.

---

# Future Roadmap

CompletedOrder

Dashboard

Receipt

SwiftData

Reports

Analytics

Do not implement roadmap items unless requested.

---

# Before Writing Code

Preserve existing architecture.

Do not rename files.

Do not change business rules.

Do not introduce third-party dependencies.

When uncertain, ask rather than assuming.
