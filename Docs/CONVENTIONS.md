# DineFlow Coding Conventions

## Purpose

This document defines the coding conventions used throughout the DineFlow project.

Every new file should follow these conventions to keep the codebase consistent and maintainable.

---

# General Principles

Code should be:

- Simple
- Readable
- Predictable
- Reusable
- Testable

Always optimize for readability over cleverness.

---

# Naming Conventions

## Views

Views describe what the user sees.

Examples:

- BillingView
- KitchenView
- OrderView
- TablesView
- SettingsView

Always end view names with **View**.

---

## Components

Components are reusable UI pieces.

Examples:

- TableCard
- StatusBadge
- BillSummary
- MenuItemRow
- PaymentButton

Avoid generic names like:

- Card
- Item
- Cell
- View1

---

## ViewModels

Every ViewModel should end with:

ViewModel

Examples:

- BillingViewModel
- OrderViewModel
- KitchenViewModel

---

## Models

Models use nouns.

Examples:

- Table
- Order
- OrderItem
- MenuItem
- KitchenTicket
- CompletedOrder

Avoid abbreviations.

---

## Stores

Application-wide state containers end with:

Store

Examples:

- RestaurantStore

---

## Enums

Enums use singular nouns.

Examples:

- TableStatus
- PaymentMethod
- OrderStatus

---

## Extensions

Extensions use:

Type+Feature.swift

Examples:

- Color+Theme.swift
- Date+Formatting.swift
- View+CardStyle.swift

---

# File Organization

Every Swift file should follow this structure:

```swift
import SwiftUI

// MARK: - Type

struct ExampleView: View {

    // MARK: - Properties

    // MARK: - Body

    // MARK: - Private Helpers
}

#Preview {

}
```

---

# MARK Usage

Always organize large files using:

- MARK: - Properties
- MARK: - Initialization
- MARK: - Body
- MARK: - Computed Properties
- MARK: - Actions
- MARK: - Private Helpers
- MARK: - Preview

---

# SwiftUI Conventions

Prefer:

- Small Views
- Private helper Views
- Computed properties
- Composition

Avoid:

- Massive body implementations
- Nested if statements
- Large switch statements
- Deep view hierarchies

---

# State Management

Use:

@Observable

@Bindable

@State

@Environment

Choose the smallest scope possible.

Avoid duplicated state.

---

# Functions

Function names should describe actions.

Examples:

startOrder()

sendToKitchen()

completePayment()

markTicketReady()

calculateGST()

Avoid names like:

doWork()

update()

process()

handle()

unless the purpose is obvious.

---

# Variables

Prefer descriptive names.

Good:

pendingItems

grandTotal

guestCount

Bad:

arr

list

temp

data

value

---

# Boolean Naming

Prefer:

isReady

isSentToKitchen

hasPendingItems

canServeFood

Avoid:

readyFlag

flag

statusBool

---

# Constants

Avoid magic numbers.

Use named constants.

Example:

maximumGuests

gstRate

animationDuration

---

# Components

If UI is reused in two or more places, consider extracting it into a reusable component.

---

# Business Logic

Business rules belong in:

- RestaurantStore
- ViewModels
- Models (when appropriate)

Business rules should never live directly inside SwiftUI Views.

---

# Comments

Write comments only when they explain intent.

Avoid comments that repeat the code.

Bad:

// Increment count

count += 1

Good:

// Preserve the original ticket so kitchen history remains accurate.

---

# Error Handling

Fail safely.

Never crash because of recoverable user actions.

---

# Documentation

Public types and complex logic should be documented when appropriate.

Keep documentation concise and accurate.

---

# Formatting

Follow Xcode's default formatting.

Use consistent indentation.

Avoid unnecessary blank lines.

Keep files easy to scan.

---

# Refactoring

When refactoring:

- Preserve behavior
- Keep APIs stable
- Explain significant changes
- Avoid unrelated modifications

---

# AI Expectations

When generating code:

- Follow these conventions.
- Match existing naming.
- Reuse existing components.
- Keep code consistent with the rest of the project.

Consistency is more important than personal preference.
