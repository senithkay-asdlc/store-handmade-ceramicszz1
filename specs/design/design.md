# Handmade Ceramics Store — Design

## Overview

A single-seller storefront: shoppers browse a product catalog, manage a cart, and check out — as a guest or signed in — with card payment and an email confirmation. The Store Admin (the shop owner) signs in to the same web application to manage the catalog, stock levels, and view incoming orders. The system is a React single-page application backed by one Ballerina API service and a Postgres database, with Thunder handling sign-in and third-party providers handling card payment and transactional email.

## Context (C1)

```mermaid
graph TD
    Shopper((Shopper))
    Admin((Store Admin))
    Webapp[Ceramics Storefront<br/>web-application]
    Auth[Thunder Auth<br/>identity provider]
    Payment[Payment Provider<br/>external]
    Email[Email Provider<br/>external]

    Shopper -->|browses, buys| Webapp
    Admin -->|manages catalog & orders| Webapp
    Webapp -->|sign-in / sign-up| Auth
    Webapp -->|catalog, cart, checkout, orders| API[Ceramics API<br/>service]
    API -->|validates tokens| Auth
    API -->|charges card| Payment
    API -->|sends confirmation| Email
```

## Domain model (ER)

```mermaid
erDiagram
    PRODUCT {
        string id
        string name
        string description
        decimal price
        string imageUrl
        int stockQuantity
        boolean soldOut
    }
    CART {
        string id
        string shopperId
        datetime updatedAt
    }
    CART_ITEM {
        string productId
        int quantity
    }
    ORDER {
        string id
        string shopperId
        string guestEmail
        string status
        decimal total
        datetime createdAt
    }
    ORDER_ITEM {
        string productId
        int quantity
        decimal unitPrice
    }
    PAYMENT {
        string id
        string orderId
        string provider
        string status
        decimal amount
    }

    CART ||--o{ CART_ITEM : contains
    CART_ITEM }o--|| PRODUCT : references
    ORDER ||--o{ ORDER_ITEM : contains
    ORDER_ITEM }o--|| PRODUCT : references
    ORDER ||--|| PAYMENT : "paid by"
```

## Key flows

### Guest checkout

```mermaid
sequenceDiagram
    participant S as Shopper
    participant W as Ceramics Storefront
    participant A as Ceramics API
    participant P as Payment Provider
    participant E as Email Provider

    S->>W: Browse catalog, add items to cart
    W->>A: GET /products, POST /carts/{id}/items
    S->>W: Proceed to checkout (guest)
    W->>A: POST /orders (guest email, cart, address)
    A->>P: Charge card
    P-->>A: Payment result
    A->>A: Decrement stock, create order
    A->>E: Send order confirmation email
    A-->>W: Order confirmed
    W-->>S: Show confirmation
```

### Admin catalog management

```mermaid
sequenceDiagram
    participant Adm as Store Admin
    participant W as Ceramics Storefront
    participant T as Thunder Auth
    participant A as Ceramics API

    Adm->>W: Sign in to admin area
    W->>T: OIDC sign-in
    T-->>W: ID/access token
    Adm->>W: Add/edit product, set stock
    W->>A: POST/PUT /products (bearer token)
    A->>T: Validate token, resolve role
    A->>A: Persist product & stock
    A-->>W: Updated product
    W-->>Adm: Catalog reflects change
```

### Signed-in shopper order history

```mermaid
sequenceDiagram
    participant S as Shopper
    participant W as Ceramics Storefront
    participant T as Thunder Auth
    participant A as Ceramics API

    S->>W: Sign in
    W->>T: OIDC sign-in
    T-->>W: ID/access token
    S->>W: View order history
    W->>A: GET /orders (bearer token)
    A->>T: Validate token
    A-->>W: Shopper's past orders
    W-->>S: Render order history
```