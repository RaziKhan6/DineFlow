
# DineFlow UI Guidelines

## Purpose

This document defines the visual design language for DineFlow.

The goal is to provide a consistent, modern, and easy-to-use interface across the application.

Every screen should follow these guidelines unless a specific exception is required.

---

# Design Principles

The interface should be:

- Clean
- Fast
- Minimal
- Consistent
- Touch-friendly
- Easy to scan

Restaurant staff should complete common tasks with as few taps as possible.

---

# Visual Style

DineFlow follows a modern card-based interface.

The design emphasizes:

- Rounded corners
- Soft shadows
- Clear spacing
- High readability
- Strong visual hierarchy

Avoid cluttered layouts.

---

# Color System

Always use colors from the Design System.

Examples:

- AppColor.primary
- AppColor.secondary
- AppColor.success
- AppColor.warning
- AppColor.error
- AppColor.background
- AppColor.surface
- AppColor.textPrimary
- AppColor.textSecondary

Never hardcode colors.

---

# Typography

Always use AppTypography.

Hierarchy should be:

- Large Title
- Title
- Headline
- Body
- Caption

Use typography to communicate importance.

Avoid manually setting font sizes.

---

# Spacing

Always use AppSpacing.

Examples:

- Extra Small
- Small
- Medium
- Large
- Extra Large

Never use arbitrary spacing values.

---

# Corner Radius

Use AppRadius throughout the application.

Examples:

- Small
- Medium
- Large

Avoid hardcoded corner radius values.

---

# Cards

Cards are the primary container.

Cards should:

- Have consistent padding
- Use rounded corners
- Include subtle shadows
- Clearly separate content

Examples:

- Table Card
- Menu Item Card
- Kitchen Ticket
- Bill Summary

---

# Buttons

Buttons should clearly indicate their purpose.

Primary Buttons

- Main actions
- High emphasis

Secondary Buttons

- Supporting actions

Destructive Buttons

- Delete
- Cancel Order
- Remove Item

Disabled buttons should clearly appear inactive.

---

# Icons

Use SF Symbols whenever possible.

Icons should support text rather than replace it.

Avoid decorative icons.

---

# Lists

Lists should:

- Be easy to scan
- Have consistent spacing
- Avoid unnecessary separators
- Highlight important information

---

# Navigation

Navigation should remain simple.

Use NavigationStack.

Titles should clearly describe the current screen.

Avoid deep navigation hierarchies.

---

# Sheets

Use sheets for:

- Quick tasks
- Editing
- Item selection
- Confirmation flows

Avoid placing large workflows inside sheets.

---

# Alerts

Use alerts only for:

- Confirmations
- Errors
- Destructive actions

Avoid showing alerts for normal workflows.

---

# Empty States

Every empty screen should explain:

- Why it is empty
- What the user should do next

Whenever possible, include a clear call-to-action.

---

# Loading States

Avoid blank screens.

Use loading indicators where appropriate.

Loading should feel responsive.

---

# Error States

Errors should:

- Explain what happened
- Suggest the next action
- Avoid technical language

Never expose implementation details.

---

# Animations

Animations should be:

- Quick
- Smooth
- Purposeful

Avoid excessive animations.

Use animation only to improve usability.

---

# Accessibility

The interface should support:

- Large touch targets
- Good color contrast
- Readable text
- Dynamic Type where practical
- VoiceOver compatibility

Accessibility should be considered from the beginning.

---

# Responsive Design

The interface should work well on:

- iPhone
- iPad

Layouts should adapt naturally to different screen sizes.

Avoid fixed-width designs.

---

# Consistency Rules

Users should never wonder how to interact with the interface.

Similar actions should look and behave the same across the application.

Reuse existing components whenever possible.

---

# AI Expectations

When generating UI:

- Reuse existing components.
- Follow the design system.
- Use consistent spacing and typography.
- Maintain visual hierarchy.
- Prioritize usability over decoration.

Every new screen should feel like it belongs in DineFlow without requiring visual redesign.
