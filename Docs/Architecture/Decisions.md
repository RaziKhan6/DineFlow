# Architecture Decisions

This document records important architectural decisions made during the development of DineFlow.

---

## ADR-001

### Feature-First Architecture

Decision:

Organize the project by feature instead of by layer.

Reason:

- Better scalability
- Easier navigation
- Reduced coupling
- Improved maintainability

---

## ADR-002

### Offline-First Design

Decision:

The application must remain functional without an internet connection.

Reason:

Restaurant operations should never depend on network availability.

---

## ADR-003

### SwiftUI + Observation

Decision:

Use SwiftUI and Apple's Observation framework.

Reason:

- Modern architecture
- Simpler state management
- Better maintainability

---

## ADR-004

### Single Source of Truth

Decision:

RestaurantStore owns restaurant state.

Reason:

Prevent duplicated state and inconsistent business rules.

---

## ADR-005

### Design System

Decision:

Use centralized colors, typography, spacing, and radius values.

Reason:

Maintain visual consistency across the application.
