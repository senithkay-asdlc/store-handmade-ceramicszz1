# Handmade Ceramics Store — PRD

## Problem Statement

Independent ceramics artisans currently have no easy way to sell their handmade work online with a proper catalog, cart, and secure checkout. Selling through generic marketplaces or social media means no control over presentation, no inventory tracking, and a clunky, ad-hoc buying experience for customers — which costs sales and makes the shop look unprofessional.

## Solution

A single-seller online store for handmade ceramics: shoppers browse a curated product catalog, add items to a cart, and check out securely with card payment — as a guest or with an account. The store owner manages the catalog and stock levels, and fulfills orders, all from a dedicated admin area.

## Actors

- **Shopper**: browses the catalog, manages a cart, checks out (as a guest or signed in), and — if signed in — views their own order history.
- **Store Admin**: the store owner; manages the product catalog and stock levels, and views incoming orders to fulfill them.

## User Stories

1. As a Shopper, I want to browse the product catalog, so that I can discover ceramics available for purchase.
2. As a Shopper, I want to view detailed information about a product, so that I can decide whether to buy it.
3. As a Shopper, I want to add products to a cart, so that I can purchase multiple items in one order.
4. As a Shopper, I want to view and edit the contents of my cart, so that I can adjust quantities or remove items before checkout.
5. As a Shopper, I want to check out without creating an account, so that I can complete a purchase quickly.
6. As a Shopper, I want to pay for my order by card, so that I can complete my purchase securely.
7. As a Shopper, I want to receive an email confirmation after placing an order, so that I have a record of my purchase.
8. As a Shopper, I want to sign in to an account, so that I can view my past orders.
9. As a Shopper, I want to view my order history, so that I can track past purchases.
10. As a Store Admin, I want to sign in to an admin area, so that I can manage the store securely.
11. As a Store Admin, I want to add, edit, and remove products in the catalog, so that I can keep the storefront up to date.
12. As a Store Admin, I want to set and update stock quantities for each product, so that shoppers only see accurate availability.
13. As a Store Admin, I want products to automatically show as sold out when stock reaches zero, so that shoppers cannot purchase unavailable items.
14. As a Store Admin, I want to view incoming orders, so that I can prepare and fulfill them.

## Product Decisions

- Single-seller storefront: one store owner manages the entire catalog; no multi-vendor/marketplace features.
- Sign-in is handled via Thunder SSO, the platform identity provider. Store Admin must sign in to reach the admin area. Shoppers may create/sign into an account (to see order history) but it is optional — guest checkout is supported.
- Checkout accepts card payment via a third-party payment provider; the specific provider is bound at design time.
- The catalog (products and stock levels) is managed exclusively by the Store Admin.
- Inventory is tracked per product as a stock quantity; a product shows as sold out and cannot be added to the cart once its stock reaches zero.
- Shoppers receive a transactional email confirmation after a successful order.

## Phasing

- **Phase 1 — Launch the single-seller ceramics storefront**: deliver the full catalog-browse, cart, guest/account checkout, card payment, order confirmation email, and admin catalog/order management experience. Stories: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14.

## Out of Scope

- Multi-vendor marketplace features (seller onboarding, per-seller payouts, seller storefronts).
- Product reviews, ratings, or wishlists.
- Discount codes, promotions, or coupon handling.
- Returns, refunds, and post-purchase dispute handling.
- Shipping carrier integration, live shipping-rate calculation, or shipment tracking numbers.
- Multi-currency or international tax/duty handling.
- Analytics dashboards or sales reporting beyond a plain order list.

## Open Questions

1. How is shipping cost determined at checkout (flat rate, free shipping, or calculated)? — deferred, does not block design; checkout can be designed with a placeholder shipping model and refined later.

## Further Notes

None.