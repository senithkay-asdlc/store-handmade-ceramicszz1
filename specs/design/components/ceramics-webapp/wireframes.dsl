// Handmade Ceramics Store — shopper storefront + Store Admin area

screen Catalog "Shoppers browse the product catalog"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  row
    heading "Handmade Ceramics"
    right
    search "Search products…"
  row
    card "Glazed Stoneware Mug | $28 | Handthrown, food-safe glaze" -> ProductDetail
    card "Speckled Serving Bowl | $54 | Wheel-thrown, one of a kind" -> ProductDetail
    card "Minimalist Vase | $42 | Sold out" -> ProductDetail
  row
    card "Ceramic Ring Dish | $18 | Small batch" -> ProductDetail
    card "Textured Planter | $36 | 6in diameter" -> ProductDetail
    card "Tea Set (4pc) | $96 | Includes tray" -> ProductDetail

screen ProductDetail "A shopper reviews one product and adds it to the cart"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  breadcrumb "Shop / Glazed Stoneware Mug"
  split 60/40
    left
      image "Product photo"
      text "Handthrown stoneware mug with a matte glaze. Food-safe and microwave-safe."
    right
      heading "Glazed Stoneware Mug"
      text "$28"
      badge "In stock" success
      select "Quantity: 1"
      button "Add to cart" primary -> Cart

screen Cart "Shopper reviews cart contents before checkout"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Your Cart"
  table "Product | Price | Qty | Subtotal"
    row "Glazed Stoneware Mug | $28 | 2 | $56"
    row "Ceramic Ring Dish | $18 | 1 | $18"
  row
    right
    text "Total: $74"
  row
    right
    button "Continue shopping"
    button "Checkout" primary -> Checkout

screen Checkout "Shopper pays and completes the order, as a guest or signed in"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Checkout"
  text "Order total: $74"
  input "Email — for your order confirmation"
  textarea "Shipping address"
  divider
  heading "Payment"
  input "Card number"
  row
    input "Expiry"
    input "CVC"
  row
    right
    button "Back to cart"
    button "Place order" primary -> OrderConfirmation

screen OrderConfirmation "Shopper sees confirmation right after a successful order"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Order Confirmed"
  badge "Paid" success
  text "Order #10482 — a confirmation email is on its way to you."
  table "Product | Qty | Subtotal"
    row "Glazed Stoneware Mug | 2 | $56"
    row "Ceramic Ring Dish | 1 | $18"
  button "Back to shop" -> Catalog

screen SignIn "A shopper or the Store Admin signs in via Thunder"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> Cart | Sign in -> SignIn"
  heading "Sign in"
  text "Sign in to view your order history, or continue as a guest at checkout."
  button "Sign in with Thunder" primary -> OrderHistory

screen OrderHistory "A signed-in shopper views their past orders"
  navbar "Ceramics Co. | Shop -> Catalog | Cart -> Cart | Orders -> OrderHistory | Account"
  heading "Your Orders"
  table "Order | Date | Total | Status" -> OrderConfirmation
    row "#10482 | Aug 10, 2026 | $74 | Paid"
    row "#10311 | Jul 22, 2026 | $28 | Paid"

screen AdminCatalog "Store Admin manages the product catalog and stock"
  navbar "Ceramics Co. Admin"
  sidebar "Catalog -> AdminCatalog | Orders -> AdminOrders"
  row
    heading "Catalog"
    right
    button "New product" primary -> AdminProductForm
  table "Product | Price | Stock | Status" -> AdminProductForm
    row "Glazed Stoneware Mug | $28 | 14 | In stock"
    row "Ceramic Ring Dish | $18 | 3 | In stock"
    row "Minimalist Vase | $42 | 0 | Sold out"

screen AdminProductForm "Store Admin adds or edits one product, including stock"
  navbar "Ceramics Co. Admin"
  sidebar "Catalog -> AdminCatalog | Orders -> AdminOrders"
  breadcrumb "Catalog / Glazed Stoneware Mug"
  input "Name"
  textarea "Description"
  row
    input "Price"
    input "Stock quantity"
  input "Image URL"
  row
    right
    button "Delete product"
    button "Save product" primary -> AdminCatalog

screen AdminOrders "Store Admin views incoming orders to fulfill"
  navbar "Ceramics Co. Admin"
  sidebar "Catalog -> AdminCatalog | Orders -> AdminOrders"
  heading "Orders"
  tabs "All (58) | Paid (55) | Failed (3)"
  table "Order | Shopper | Total | Status | Placed"
    row "#10482 | jane@example.com | $74 | Paid | Aug 10, 2026"
    row "#10481 | guest | $18 | Paid | Aug 10, 2026"
    row "#10480 | m.diaz@example.com | $42 | Failed | Aug 9, 2026"
