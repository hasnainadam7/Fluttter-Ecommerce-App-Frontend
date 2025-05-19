const admin = require("firebase-admin");
const fs = require("fs");

// Initialize Firebase Admin
const serviceAccount = require("./getxfirebase1-firebase-adminsdk-j8lsw-c52b581a18.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();

const baseUrl =
  "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2F";

async function seedCategories() {
  const categories = [
    {
      name: "Sports",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-bowling-64.png?alt=media",
    },
    {
      name: "Clothing",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-tailors-dummy-64.png?alt=media",
    },
    {
      name: "Shoes",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-shoes-64.png?alt=media",
    },
    {
      name: "Cosmetics",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-cosmetics-64.png?alt=media",
    },
    {
      name: "Animals",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-dog-heart-64.png?alt=media",
    },
    {
      name: "Toys",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-wooden-toy-car-50.png?alt=media",
    },
    {
      name: "Furniture",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-dining-chair-64.png?alt=media",
    },
    {
      name: "Jewelry",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-sparkling-diamond-64.png?alt=media",
    },
    {
      name: "Electronics",
      image:
        "https://firebasestorage.googleapis.com/v0/b/getxfirebase1.appspot.com/o/imgs%2Fcategories%2Ficons8-smartphone-64.png?alt=media",
    },
  ];
  const collectionRef = db.collection("Categories");

  for (let i = 0; i < categories.length; i++) {
    const cat = categories[i];
    const customId = (i + 1).toString(); // '1', '2', ...

    const data = {
      id: (i + 1).toString(), // Convert to String since id is String
      name: cat.name,
      image: cat.image,
      isFeatured: true,
      parentId: null,
    };

    try {
      await collectionRef.doc(customId).set(data);
      console.log(`✅ Added ${cat.name} with doc ID: ${customId}`);
    } catch (err) {
      console.error(`❌ Failed to add ${cat.name}:`, err);
    }
  }
}

//banner Data
async function seedBanners() {
  const ref = db.collection("Banners");
  const banners = Array.from({ length: 8 }, (_, i) => ({
    id: i + 1,
    banner: `${baseUrl}banners%2Fbanner_${i + 1}.jpg?alt=media`,
  }));
  for (const bannerObj of banners) {
    const docId = bannerObj.id.toString(); // "1", "2", etc.

    try {
      await ref.doc(docId).set(bannerObj);
      console.log(`✅ Banner ${docId} added!`);
    } catch (err) {
      console.error(`❌ Failed to add banner ${docId}:`, err);
    }
  }

  console.log("🚀 All banners added to Firestore!");
}
async function seedPromoBanners() {
  const ref = db.collection("PromoBanners");
  const PromoBanners = Array.from({ length: 3 }, (_, i) => ({
    id: i + 1,
    banner: `${baseUrl}promo_banners%2Fpromo-banner-${i + 1}.png?alt=media`,
  }));
  for (const bannerObj of PromoBanners) {
    const docId = bannerObj.id.toString(); // "1", "2", etc.

    try {
      await ref.doc(docId).set(bannerObj);
      console.log(`✅ Promo Banner Banner ${docId} added!`);
    } catch (err) {
      console.error(`❌ Failed to add Promo banner ${docId}:`, err);
    }
  }

  console.log("🚀 All Promo banners added to Firestore!");
}





// Function to seed products data
async function seedProducts() {
  const productsRef = db.collection("Products");
  
  // Product data array
  const products = [
    // SHOES - Variable Products
    {
      id: "1",
      title: "Nike Air Jordan Basketball Shoes",
      description: "High-performance basketball shoes with excellent grip and ankle support",
      price: 199.99,
      salePrice: 179.99,
      thumbnail: `${baseUrl}products%2FNikeAirJOrdonBlackRed.png?alt=media`,
      images: [
        `${baseUrl}products%2FNikeAirJOrdonBlackRed.png?alt=media`,
        `${baseUrl}products%2FNikeAirJOrdonOrange.png?alt=media`,
        `${baseUrl}products%2FNikeAirJordonwhiteMagenta.png?alt=media`,
        `${baseUrl}products%2FNikeAirJOrdonWhiteRed.png?alt=media`
      ],
      categoryId: "3", // Shoes
      isFeatured: true,
      stock: 45,
      sku: "NK-AJ-001",
      productType: "ProductType.variable",
      productAttributes: [
        {
          name: "Color",
          values: ["Black/Red", "Orange", "White/Magenta", "White/Red"]
        },
        {
          name: "Size",
          values: ["EU 38", "EU 39", "EU 40", "EU 41", "EU 42"]
        }
      ],
      productVariations: [
        {
          id: "1",
          attributeValues: {
            color: "Black/Red",
            size: "EU 40"
          },
          description: "Black and Red Nike Air Jordan Basketball Shoes, EU size 40",
          image: `${baseUrl}products%2FNikeAirJOrdonBlackRed.png?alt=media`,
          price: 199.99,
          salePrice: 179.99,
          stock: 12,
          sku: "NK-AJ-BR-40"
        },
        {
          id: "2",
          attributeValues: {
            color: "Orange",
            size: "EU 41"
          },
          description: "Orange Nike Air Jordan Basketball Shoes, EU size 41",
          image: `${baseUrl}products%2FNikeAirJOrdonOrange.png?alt=media`,
          price: 199.99,
          salePrice: 179.99,
          stock: 8,
          sku: "NK-AJ-OR-41"
        },
        {
          id: "3",
          attributeValues: {
            color: "White/Magenta",
            size: "EU 42"
          },
          description: "White and Magenta Nike Air Jordan Basketball Shoes, EU size 42",
          image: `${baseUrl}products%2FNikeAirJordonwhiteMagenta.png?alt=media`,
          price: 199.99,
          salePrice: 179.99,
          stock: 15,
          sku: "NK-AJ-WM-42"
        },
        {
          id: "4",
          attributeValues: {
            color: "White/Red",
            size: "EU 39"
          },
          description: "White and Red Nike Air Jordan Basketball Shoes, EU size 39",
          image: `${baseUrl}products%2FNikeAirJOrdonWhiteRed.png?alt=media`,
          price: 199.99,
          salePrice: 179.99,
          stock: 10,
          sku: "NK-AJ-WR-39"
        }
      ]
    },
    {
      id: "2",
      title: "Nike Air Max Running Shoes",
      description: "Comfortable running shoes with air cushioning for maximum comfort",
      price: 149.99,
      salePrice: 129.99,
      thumbnail: `${baseUrl}products%2FNikeAirMax.png?alt=media`,
      images: [
        `${baseUrl}products%2FNikeAirMax.png?alt=media`,
        `${baseUrl}products%2FNikeBasketballShoeGreenBlack.png?alt=media`,
        `${baseUrl}products%2FNikeWildhorse.png?alt=media`
      ],
      categoryId: "3", // Shoes
      isFeatured: true,
      stock: 30,
      sku: "NK-AM-001",
      productType: "ProductType.variable",
      productAttributes: [
        {
          name: "Color",
          values: ["Blue/White", "Green/Black", "Red/Grey"]
        },
        {
          name: "Size",
          values: ["EU 38", "EU 39", "EU 40", "EU 41", "EU 42", "EU 43"]
        }
      ],
      productVariations: [
        {
          id: "1",
          attributeValues: {
            color: "Blue/White",
            size: "EU 40"
          },
          description: "Blue and White Nike Air Max Running Shoes, EU size 40",
          image: `${baseUrl}products%2FNikeAirMax.png?alt=media`,
          price: 149.99,
          salePrice: 129.99,
          stock: 8,
          sku: "NK-AM-BW-40"
        },
        {
          id: "2",
          attributeValues: {
            color: "Green/Black",
            size: "EU 42"
          },
          description: "Green and Black Nike Air Max Running Shoes, EU size 42",
          image: `${baseUrl}products%2FNikeBasketballShoeGreenBlack.png?alt=media`,
          price: 149.99,
          salePrice: 129.99,
          stock: 12,
          sku: "NK-AM-GB-42"
        },
        {
          id: "3",
          attributeValues: {
            color: "Red/Grey",
            size: "EU 41"
          },
          description: "Red and Grey Nike Air Max Running Shoes, EU size 41",
          image: `${baseUrl}products%2FNikeWildhorse.png?alt=media`,
          price: 149.99,
          salePrice: 129.99,
          stock: 10,
          sku: "NK-AM-RG-41"
        }
      ]
    },
    // CLOTHING - Variable Products
    {
      id: "3",
      title: "Men's Track Suit",
      description: "Comfortable track suit perfect for workouts and casual wear",
      price: 89.99,
      salePrice: 69.99,
      thumbnail: `${baseUrl}products%2Ftracksuit_black.png?alt=media`,
      images: [
        `${baseUrl}products%2Ftracksuit_black.png?alt=media`,
        `${baseUrl}products%2Ftracksuit_blue.png?alt=media`,
        `${baseUrl}products%2Ftracksuit_red.png?alt=media`,
        `${baseUrl}products%2Ftrcksuit_parrotgreen.png?alt=media`
      ],
      categoryId: "2", // Clothing
      isFeatured: true,
      stock: 50,
      sku: "CL-TS-001",
      productType: "ProductType.variable",
      productAttributes: [
        {
          name: "Color",
          values: ["Black", "Blue", "Red", "Green"]
        },
        {
          name: "Size",
          values: ["S", "M", "L", "XL", "XXL"]
        }
      ],
      productVariations: [
        {
          id: "1",
          attributeValues: {
            color: "Black",
            size: "M"
          },
          description: "Black Men's Track Suit, Size M",
          image: `${baseUrl}products%2Ftracksuit_black.png?alt=media`,
          price: 89.99,
          salePrice: 69.99,
          stock: 15,
          sku: "CL-TS-BK-M"
        },
        {
          id: "2",
          attributeValues: {
            color: "Blue",
            size: "L"
          },
          description: "Blue Men's Track Suit, Size L",
          image: `${baseUrl}products%2Ftracksuit_blue.png?alt=media`,
          price: 89.99,
          salePrice: 69.99,
          stock: 12,
          sku: "CL-TS-BL-L"
        },
        {
          id: "3",
          attributeValues: {
            color: "Red",
            size: "XL"
          },
          description: "Red Men's Track Suit, Size XL",
          image: `${baseUrl}products%2Ftracksuit_red.png?alt=media`,
          price: 89.99,
          salePrice: 69.99,
          stock: 10,
          sku: "CL-TS-RD-XL"
        },
        {
          id: "4",
          attributeValues: {
            color: "Green",
            size: "L"
          },
          description: "Green Men's Track Suit, Size L",
          image: `${baseUrl}products%2Ftrcksuit_parrotgreen.png?alt=media`,
          price: 89.99,
          salePrice: 69.99,
          stock: 8,
          sku: "CL-TS-GR-L"
        }
      ]
    },
    {
      id: "4",
      title: "Men's Polo T-Shirts",
      description: "Classic polo t-shirts in various colors for casual and semi-formal occasions",
      price: 39.99,
      salePrice: 29.99,
      thumbnail: `${baseUrl}products%2Ftshirt_red_collar.png?alt=media`,
      images: [
        `${baseUrl}products%2Ftshirt_red_collar.png?alt=media`,
        `${baseUrl}products%2Ftshirt_yellow_collar.png?alt=media`,
        `${baseUrl}products%2Ftshirt_green_collar.png?alt=media`,
        `${baseUrl}products%2Ftshirt_blue_collar.png?alt=media`
      ],
      categoryId: "2", // Clothing
      isFeatured: true,
      stock: 100,
      sku: "CL-PT-001",
      productType: "ProductType.variable",
      productAttributes: [
        {
          name: "Color",
          values: ["Red", "Yellow", "Green", "Blue"]
        },
        {
          name: "Size",
          values: ["S", "M", "L", "XL"]
        }
      ],
      productVariations: [
        {
          id: "1",
          attributeValues: {
            color: "Red",
            size: "M"
          },
          description: "Red Men's Polo T-Shirt, Size M",
          image: `${baseUrl}products%2Ftshirt_red_collar.png?alt=media`,
          price: 39.99,
          salePrice: 29.99,
          stock: 25,
          sku: "CL-PT-RD-M"
        },
        {
          id: "2",
          attributeValues: {
            color: "Yellow",
            size: "L"
          },
          description: "Yellow Men's Polo T-Shirt, Size L",
          image: `${baseUrl}products%2Ftshirt_yellow_collar.png?alt=media`,
          price: 39.99,
          salePrice: 29.99,
          stock: 20,
          sku: "CL-PT-YL-L"
        },
        {
          id: "3",
          attributeValues: {
            color: "Green",
            size: "XL"
          },
          description: "Green Men's Polo T-Shirt, Size XL",
          image: `${baseUrl}products%2Ftshirt_green_collar.png?alt=media`,
          price: 39.99,
          salePrice: 29.99,
          stock: 15,
          sku: "CL-PT-GR-XL"
        },
        {
          id: "4",
          attributeValues: {
            color: "Blue",
            size: "S"
          },
          description: "Blue Men's Polo T-Shirt, Size S",
          image: `${baseUrl}products%2Ftshirt_blue_collar.png?alt=media`,
          price: 39.99,
          salePrice: 29.99,
          stock: 18,
          sku: "CL-PT-BL-S"
        }
      ]
    },
    // ELECTRONICS - Variable Products
    {
      id: "5",
      title: "iPhone 12",
      description: "Apple iPhone 12 with A14 Bionic chip and Super Retina XDR display",
      price: 799.99,
      salePrice: 749.99,
      thumbnail: `${baseUrl}products%2Fiphone_12_red.png?alt=media`,
      images: [
        `${baseUrl}products%2Fiphone_12_red.png?alt=media`,
        `${baseUrl}products%2Fiphone_12_blue.png?alt=media`,
        `${baseUrl}products%2Fiphone_12_green.png?alt=media`,
        `${baseUrl}products%2Fiphone_12_black.png?alt=media`
      ],
      categoryId: "9", // Electronics
      isFeatured: true,
      stock: 40,
      sku: "EL-IP12-001",
      productType: "ProductType.variable",
      productAttributes: [
        {
          name: "Color",
          values: ["Red", "Blue", "Green", "Black"]
        },
        {
          name: "Storage",
          values: ["64GB", "128GB", "256GB"]
        }
      ],
      productVariations: [
        {
          id: "1",
          attributeValues: {
            color: "Red",
            storage: "128GB"
          },
          description: "Red iPhone 12 with 128GB Storage",
          image: `${baseUrl}products%2Fiphone_12_red.png?alt=media`,
          price: 849.99,
          salePrice: 799.99,
          stock: 10,
          sku: "EL-IP12-RD-128"
        },
        {
          id: "2",
          attributeValues: {
            color: "Blue",
            storage: "64GB"
          },
          description: "Blue iPhone 12 with 64GB Storage",
          image: `${baseUrl}products%2Fiphone_12_blue.png?alt=media`,
          price: 799.99,
          salePrice: 749.99,
          stock: 8,
          sku: "EL-IP12-BL-64"
        },
        {
          id: "3",
          attributeValues: {
            color: "Green",
            storage: "256GB"
          },
          description: "Green iPhone 12 with 256GB Storage",
          image: `${baseUrl}products%2Fiphone_12_green.png?alt=media`,
          price: 949.99,
          salePrice: 899.99,
          stock: 5,
          sku: "EL-IP12-GR-256"
        },
        {
          id: "4",
          attributeValues: {
            color: "Black",
            storage: "128GB"
          },
          description: "Black iPhone 12 with 128GB Storage",
          image: `${baseUrl}products%2Fiphone_12_black.png?alt=media`,
          price: 849.99,
          salePrice: 799.99,
          stock: 12,
          sku: "EL-IP12-BK-128"
        }
      ]
    },
    {
      id: "6",
      title: "Acer Laptop",
      description: "Acer high-performance laptop with latest specifications",
      price: 999.99,
      salePrice: 899.99,
      thumbnail: `${baseUrl}products%2Facer_laptop_1.png?alt=media`,
      images: [
        `${baseUrl}products%2Facer_laptop_1.png?alt=media`,
        `${baseUrl}products%2Facer_laptop_2.png?alt=media`,
        `${baseUrl}products%2Facer_laptop_3.png?alt=media`,
        `${baseUrl}products%2Facer_laptop_4.png?alt=media`
      ],
      categoryId: "9", // Electronics
      isFeatured: true,
      stock: 25,
      sku: "EL-ACL-001",
      productType: "ProductType.variable",
      productAttributes: [
        {
          name: "Model",
          values: ["Aspire 5", "Swift 3", "Predator", "Nitro 5"]
        },
        {
          name: "RAM",
          values: ["8GB", "16GB", "32GB"]
        },
        {
          name: "Storage",
          values: ["256GB SSD", "512GB SSD", "1TB SSD"]
        }
      ],
      productVariations: [
        {
          id: "1",
          attributeValues: {
            model: "Aspire 5",
            ram: "8GB",
            storage: "256GB SSD"
          },
          description: "Acer Aspire 5 with 8GB RAM and 256GB SSD",
          image: `${baseUrl}products%2Facer_laptop_1.png?alt=media`,
          price: 699.99,
          salePrice: 649.99,
          stock: 7,
          sku: "EL-ACL-AS5-8GB-256"
        },
        {
          id: "2",
          attributeValues: {
            model: "Swift 3",
            ram: "16GB",
            storage: "512GB SSD"
          },
          description: "Acer Swift 3 with 16GB RAM and 512GB SSD",
          image: `${baseUrl}products%2Facer_laptop_2.png?alt=media`,
          price: 899.99,
          salePrice: 849.99,
          stock: 5,
          sku: "EL-ACL-SW3-16GB-512"
        },
        {
          id: "3",
          attributeValues: {
            model: "Predator",
            ram: "32GB",
            storage: "1TB SSD"
          },
          description: "Acer Predator with 32GB RAM and 1TB SSD",
          image: `${baseUrl}products%2Facer_laptop_3.png?alt=media`,
          price: 1599.99,
          salePrice: 1499.99,
          stock: 3,
          sku: "EL-ACL-PR-32GB-1TB"
        },
        {
          id: "4",
          attributeValues: {
            model: "Nitro 5",
            ram: "16GB",
            storage: "512GB SSD"
          },
          description: "Acer Nitro 5 with 16GB RAM and 512GB SSD",
          image: `${baseUrl}products%2Facer_laptop_4.png?alt=media`,
          price: 1199.99,
          salePrice: 1099.99,
          stock: 6,
          sku: "EL-ACL-NT5-16GB-512"
        }
      ]
    },
    // FURNITURE - Single Products
    {
      id: "7",
      title: "Modern Bedroom Bed",
      description: "Stylish modern king-size bed for your bedroom",
      price: 599.99,
      salePrice: 499.99,
      thumbnail: `${baseUrl}products%2Fbedroom_bed.png?alt=media`,
      images: [
        `${baseUrl}products%2Fbedroom_bed.png?alt=media`,
        `${baseUrl}products%2Fbedroom_bed_black.png?alt=media`,
        `${baseUrl}products%2Fbedroom_bed_grey.png?alt=media`,
        `${baseUrl}products%2Fbedroom_bed_simple_brown.png?alt=media`
      ],
      categoryId: "7", // Furniture
      isFeatured: true,
      stock: 10,
      sku: "FN-BD-001",
      productType: "ProductType.single",
      units: "piece"
    },
    {
      id: "8",
      title: "Bedroom Wardrobe",
      description: "Spacious wardrobe with multiple compartments",
      price: 799.99,
      salePrice: 699.99,
      thumbnail: `${baseUrl}products%2Fbedroom_wardrobe.png?alt=media`,
      images: [
        `${baseUrl}products%2Fbedroom_wardrobe.png?alt=media`
      ],
      categoryId: "7", // Furniture
      isFeatured: false,
      stock: 5,
      sku: "FN-WD-001",
      productType: "ProductType.single",
      units: "piece"
    },
    {
      id: "9",
      title: "Kitchen Dining Table",
      description: "Elegant dining table for your kitchen or dining room",
      price: 399.99,
      salePrice: 349.99,
      thumbnail: `${baseUrl}products%2Fkitchen_dining%20table.png?alt=media`,
      images: [
        `${baseUrl}products%2Fkitchen_dining%20table.png?alt=media`
      ],
      categoryId: "7", // Furniture
      isFeatured: true,
      stock: 8,
      sku: "FN-DT-001",
      productType: "ProductType.single",
      units: "piece"
    },
    {
      id: "10",
      title: "Office Chair",
      description: "Comfortable ergonomic office chair",
      price: 199.99,
      salePrice: 159.99,
      thumbnail: `${baseUrl}products%2Foffice_chair_1.png?alt=media`,
      images: [
        `${baseUrl}products%2Foffice_chair_1.png?alt=media`,
        `${baseUrl}products%2Foffice_chair_2.png?alt=media`
      ],
      categoryId: "7", // Furniture
      isFeatured: true,
      stock: 15,
      sku: "FN-OC-001",
      productType: "ProductType.single",
      units: "piece"
    },
    // SPORTS - Single Products
    {
      id: "11",
      title: "Adidas Football",
      description: "Professional Adidas football for matches and practice",
      price: 49.99,
      salePrice: 39.99,
      thumbnail: `${baseUrl}products%2FAdidas_Football.png?alt=media`,
      images: [
        `${baseUrl}products%2FAdidas_Football.png?alt=media`
      ],
      categoryId: "1", // Sports
      isFeatured: true,
      stock: 30,
      sku: "SP-FB-001",
      productType: "ProductType.single",
      units: "piece"
    },
    {
      id: "12",
      title: "Baseball Bat",
      description: "Professional-grade baseball bat",
      price: 79.99,
      salePrice: 69.99,
      thumbnail: `${baseUrl}products%2Fbaseball_bat.png?alt=media`,
      images: [
        `${baseUrl}products%2Fbaseball_bat.png?alt=media`
      ],
      categoryId: "1", // Sports
      isFeatured: false,
      stock: 20,
      sku: "SP-BB-001",
      productType: "ProductType.single",
      units: "piece"
    },
    {
      id: "13",
      title: "Cricket Bat",
      description: "Premium cricket bat for professional play",
      price: 89.99,
      salePrice: 79.99,
      thumbnail: `${baseUrl}products%2Fcricket_bat.png?alt=media`,
      images: [
        `${baseUrl}products%2Fcricket_bat.png?alt=media`
      ],
      categoryId: "1", // Sports
      isFeatured: true,
      stock: 25,
      sku: "SP-CB-001",
      productType: "ProductType.single",
      units: "piece"
    },
    {
      id: "14",
      title: "Tennis Racket",
      description: "Professional tennis racket for tournaments and practice",
      price: 129.99,
      salePrice: 109.99,
      thumbnail: `${baseUrl}products%2Ftennis_racket.png?alt=media`,
      images: [
        `${baseUrl}products%2Ftennis_racket.png?alt=media`
      ],
      categoryId: "1", // Sports
      isFeatured: true,
      stock: 15,
      sku: "SP-TR-001",
      productType: "ProductType.single",
      units: "piece"
    },
    // ANIMALS - Single Products
    {
      id: "15",
      title: "Tomi Dog Food",
      description: "Premium dog food for healthy pets",
      price: 29.99,
      salePrice: 24.99,
      thumbnail: `${baseUrl}products%2Ftomi_dogfood.png?alt=media`,
      images: [
        `${baseUrl}products%2Ftomi_dogfood.png?alt=media`
      ],
      categoryId: "5", // Animals
      isFeatured: true,
      stock: 50,
      sku: "AN-DF-001",
      productType: "ProductType.single",
      units: "pack"
    }
  ];

  // Store each product in Firebase
  for (const product of products) {
    try {
      await productsRef.doc(product.id).set(product);
      console.log(`✅ Product added: ${product.title} with ID: ${product.id}`);
    } catch (error) {
      console.error(`❌ Error adding product ${product.title}:`, error);
    }
  }

  console.log("🚀 All products added to Firestore!");
}

// Execute the seed function
// seedProducts() /

.then(() => {
  console.log("Seeding complete! 🎉");
  process.exit(0);
}).catch(error => {
  console.error("Seeding failed:", error);
  process.exit(1);
});

// seedPromoBanners();
// seedBanners();
// seedCategories()
