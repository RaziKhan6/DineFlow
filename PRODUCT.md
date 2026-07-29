# DineFlow Product Documentation

## Vision

DineFlow is a modern, offline-first restaurant Point of Sale (POS) application designed to simplify restaurant operations for waiters, kitchen staff, cashiers, and managers.

The primary goal is to provide a fast, reliable, and intuitive ordering experience that continues to work even without an internet connection.

---

# Product Goals

DineFlow is designed to achieve the following goals:

- Reduce order-taking time.
- Minimize communication errors between waiters and the kitchen.
- Support restaurants of different sizes.
- Keep the user interface clean and easy to learn.
- Allow staff to complete common tasks with minimal taps.
- Maintain fast performance on both iPhone and iPad.
- Work completely offline during restaurant operations.

---

# Target Users

DineFlow is intended for:

- Small Restaurants
- Cafés
- Food Courts
- Fine Dining Restaurants
- Multi-floor Restaurants
- Cloud Kitchens (future)

---

# User Roles

## Waiter

Responsibilities:

- Manage tables
- Record guest count
- Take customer orders
- Send items to the kitchen
- Serve food
- Generate bills

---

## Kitchen Staff

Responsibilities:

- Receive Kitchen Order Tickets (KOT)
- Prepare food
- Mark tickets as ready

---

## Cashier

Responsibilities:

- Review bills
- Select payment method
- Receive payment
- Complete transactions

---

## Manager (Future)

Responsibilities:

- View sales reports
- View analytics
- Manage menu items
- Manage staff
- View restaurant performance

---

# Core Features

Current product features include:

- Table Management
- Guest Count
- Menu Browsing
- Order Management
- Multiple Kitchen Order Tickets
- Kitchen Workflow
- Billing
- Payment Collection

Future features:

- Dashboard
- Sales Analytics
- Receipt Printing
- Split Billing
- Discounts
- Inventory Management
- Reservations
- Customer History

---

# Restaurant Workflow

The normal restaurant workflow is:

Available Table

↓

Select Table

↓

Enter Guest Count

↓

Create Order

↓

Add Menu Items

↓

Send Items to Kitchen

↓

Kitchen Preparing

↓

Kitchen Ready

↓

Serve Food

↓

Billing

↓

Receive Payment

↓

Available Table

Every feature in DineFlow should support this workflow.

---

# Kitchen Workflow

Kitchen staff should only receive newly added items.

Previously sent items must never be sent again.

A single customer order may generate multiple Kitchen Order Tickets.

Example:

- Customer orders Pizza
- Kitchen begins preparation
- Customer orders Coke
- Kitchen receives a second ticket containing only the Coke

The table becomes ready only after every active Kitchen Order Ticket has been completed.

---

# Billing Workflow

Billing begins only after food has been served.

The billing screen should display:

- Table Number
- Guest Count
- Ordered Items
- Subtotal
- Taxes
- Grand Total

The cashier selects a payment method before completing the transaction.

---

# Payment Workflow

Supported payment methods:

- Cash
- Card
- UPI

After successful payment:

- Order is completed.
- Table becomes available.
- Restaurant history is updated.
- Sales statistics are updated.

---

# Business Rules

The following rules must always be respected:

- A table cannot have multiple active orders.
- Sent kitchen items cannot be edited.
- Only pending items may be sent to the kitchen.
- Billing cannot begin while pending kitchen items exist.
- A table becomes ready only when every kitchen ticket is ready.
- Completing payment closes the order.

---

# Non-Goals

DineFlow is intentionally focused on restaurant operations.

The application is not intended to:

- Manage accounting
- Process online orders
- Handle customer delivery
- Replace ERP software
- Perform inventory forecasting
- Support multi-branch synchronization (current version)

These features may be considered in future versions.

---

# Future Product Roadmap

Planned features include:

Phase 1
- Completed Order History
- Dashboard
- Sales Reports

Phase 2
- Receipt Printing
- SwiftData Persistence
- Discounts
- Split Billing

Phase 3
- Customer Profiles
- Inventory
- Reservations
- Staff Management
- Multi-Branch Support

---

# Success Principles

Every feature added to DineFlow should improve one or more of the following:

- Speed
- Simplicity
- Reliability
- Offline capability
- User experience
- Maintainability

If a new feature makes the product more complicated without providing significant value, it should be reconsidered.
