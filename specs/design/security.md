# Security Design

## Roles → permissions

Checkout and catalog browsing (stories 1–7) require no sign-in at all — guest checkout is a deliberate product decision, not an omission.

## Authentication (Thunder)

- Shared dependency name: **`user-auth`** — declared identically on the Ceramics Storefront (web-application) and the Ceramics API (service), tying browser sign-in to the bearer tokens the API validates.
- Scopes: default `openid profile email`.
- Sign-in is OPTIONAL for the Shopper flow (guest checkout) and REQUIRED to reach the admin area or to view order history.
- Components on the "signed-in" side of Thunder: Ceramics Storefront (initiates OIDC + PKCE sign-in) and Ceramics API (validates the bearer token on every authenticated request).

## Role resolution

- The gateway injects the caller's identity from the validated token; the Ceramics API reads the Store Admin role from the token's `role`/`groups` claim (provisioned for the one store-owner account).
- Any authenticated caller without the admin claim is treated as a Shopper — never granted admin actions.
- An unauthenticated caller may only reach the guest-eligible endpoints (catalog read, cart, guest order creation); any other endpoint denies by default with `401`.