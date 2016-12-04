# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(
  name: 'admin'
)

r  = Restaurant.create(
  name: 'The Halal Guys SF',
  address_line_1: 'Tenderloin, Union Square',
  url: 'https://www.trycaviar.com/san-francisco/the-halal-guys-sf-3229',
  photo_link: 'http://insidescoopsf.sfgate.com/files/2015/10/11350428_996262303731966_1009211251349128916_n.jpg',
  banner_link: 'http://insidescoopsf.sfgate.com/files/2015/10/11350428_996262303731966_1009211251349128916_n.jpg'
)

Restaurant.create(
  name: 'Mura(DJ Sushi)',
  address_line_1: '450 Broadway St',
  address_line_2: 'San Francisco, CA 94133',
  url: 'http://www.djsushisf.com/',
  photo_link: 'http://www.eschelonexperiences.com/wp-content/uploads/2014/01/Mura-Banner.jpg',
  banner_link: 'http://murarestaurant.com/uploads/store/image/2xd6t/thumb_large_Untitled-1.png'
)

Restaurant.create(
  name: '4505 Burgers & BBQ',
  address_line_1: '705 Divisadero (at Grove St.)',
  address_line_2: 'San Francisco, CA 94117',
  url: 'https://4505meats.com/4505-burgers-bbq/',
  photo_link: 'https://testerfoodblog.files.wordpress.com/2014/07/dsc01669.jpg',
  banner_link: 'https://4505meats.com/media/wysiwyg/plateEditjpeg.jpg'
)

Restaurant.create(
  name: 'The Italian Homemade Company',
  address_line_1: '1919 Union St.',
  address_line_2: 'San Francisco, CA 94123',
  url: 'https://www.yelp.com/biz/the-italian-homemade-company-san-francisco-6',
  photo_link: 'https://s3-media3.fl.yelpcdn.com/bphoto/idbnT2rJm0TGg9zIgmveeA/o.jpg',
  banner_link: 'https://cdn0.vox-cdn.com/thumbor/5YWGo00ATDFcmgdfv8udfCx7UdQ=/0x92:1000x655/1600x900/cdn0.vox-cdn.com/uploads/chorus_image/image/47035916/Italian_Homemade_Company.0.0.jpg'
)

Restaurant.create(
  name: 'La Mediterranee',
  address_line_1: '2210 Fillmore St.',
  address_line_2: 'San Francisco, CA 94115',
  url: 'http://www.cafelamed.com/',
  photo_link: 'http://i0.wp.com/www.dailycal.org/assets/uploads/2015/03/best-mediterranean-food.alex-turney-900x580.jpg',
  banner_link: 'http://www.casablancamedicuisine.com/images/banner3.jpg'
)

Restaurant.create(
  name: 'Split Bread',
  address_line_1: '145 4th St.',
  address_line_2: 'San Francisco, CA 94103',
  url: 'http://www.splitbread.com',
  photo_link: 'https://sparklingandsweet.files.wordpress.com/2012/09/img_0841.jpg',
  banner_link: 'https://usa.visa.com/content/dam/VCOM/campaigns/omc/card-split-bread-1600x900.jpg'
)

Restaurant.create(
  name: 'Little Delhi',
  address_line_1: '83 Eddy St.',
  address_line_2: 'San Francisco, CA 94102',
  url: 'http://littledelhi.com',
  photo_link: 'https://s3-media3.fl.yelpcdn.com/bphoto/CfvU68fhM_dcwyNz_RIt9A/o.jpg',
  banner_link: 'http://www.littledelhisf.com/images/indian10.jpg.jpg'
)

Restaurant.create(
  name: 'Don Pistos',
  address_line_1: '510 Union St.',
  address_line_2: 'San Francisco, CA 94133',
  url: 'http://ww3.hdnux.com/photos/06/70/65/1805662/9/1024x1024.jpg',
  photo_link: 'http://www.jetsetchristina.com/wp-content/uploads/2016/05/DP.jpg',
  banner_link: 'http://cdn.funcheap.com/wp-content/uploads/2014/05/img_11701.jpg'
)

s = Restaurant.create(
  name: 'Schillings Cafe',
  address_line_1: '667-669 Commercial St.',
  address_line_2: 'San Francisco, CA 94111',
  url: 'http://schillingcafe.com',
  photo_link: 'https://s3-media4.fl.yelpcdn.com/bphoto/i1_QqR_iPnrSaRlUho4kiA/o.jpg',
  banner_link: 'http://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/Spain/Barcelona/nightlife/bar_drink_28_cafe-schilling-large.jpg'
)

FoodItem.create(
  name: 'Turkey Pesto Baguette',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/MMJfn5avaOuy0x9aXpB0gyyrqRQ=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21014.jpg'
)

FoodItem.create(
  name: 'Chicken & Avocado Salad',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/xfQP06amiPsV90d-OwPVj0UDz5Y=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21008.jpg'
)

FoodItem.create(
  name: 'Wild Salmon & Super Greens Salad',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/FSzeXEENoXN9LHyJmx7pi51KefI=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21023.jpg'
)

FoodItem.create(
  name: 'Ham & Cheese Baguette',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/Uyb9A_oWw_rcOaxmrioIvvTOk3Y=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21012.jpg'
)

FoodItem.create(
  name: 'Brie, Tomato & Basil Baguette',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/2qTq_cTOLSMBULANYF776cqnucQ=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21003.jpg'
)

FoodItem.create(
  name: 'Market Fresh Salad',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/4Ua-gmWWPkIIbjPWzPn-eZsqa-k=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21011.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Mediterranean Avocado Baguette',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/HC3qMCneiGHi3TnoH_AuhOBVX3I=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21032.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Italian Prosciutto Baguette',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/shQyYgqApr5qSCUHvHv-NnHCMQc=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21006.jpg'
)

FoodItem.create(
  name: "Schilling's Cobb Salad",
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/Ozrvcq-zM13W4cF_gl4mfFdTGTs=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21010.jpg'
)

FoodItem.create(
  name: 'Fruit Bowl',
  restaurant_id: s.id,
  photo_link: 'https://img.trycaviar.com/qIpw725h6x0j98wpo3ODvdvI-Y8=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/519/21017.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Chicken Platter',
  restaurant_id: r.id,
  photo_link: 'https://s3.amazonaws.com/trycaviar.com/offers/3229/126988-201604120049.jpg'
)

FoodItem.create(
  name: 'Combo Platter',
  restaurant_id: r.id,
  photo_link: 'https://s3.amazonaws.com/trycaviar.com/offers/3229/126989-201604120049.jpg'
)

FoodItem.create(
  name: 'Falafel Platter',
  restaurant_id: r.id,
  photo_link: 'https://s3.amazonaws.com/trycaviar.com/offers/3229/126991-201604120049.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Baklava',
  restaurant_id: r.id,
  photo_link: 'https://s3.amazonaws.com/trycaviar.com/offers/3229/126992-201604120049.jpg',
  side_dish: true
)

FoodItem.create(
  name: 'WhiteSauce',
  restaurant_id: r.id,
  photo_link: 'https://s3.amazonaws.com/trycaviar.com/offers/3229/126993-201604120049.jpg',
  side_dish: true
)

FoodItem.create(
  name: 'HotSauce',
  restaurant_id: r.id,
  photo_link: 'https://s3.amazonaws.com/trycaviar.com/offers/3229/126995-201604120049.jpg',
  side_dish: true
)


rng = Restaurant.create(
  name: 'R&G Lounge',
  address_line_1: '631 Kearny St.',
  address_line_2: 'San Francisco, CA 94108',
  url: 'http://rnglounge.com/',
  photo_link: 'http://photos2.meetupstatic.com/photos/event/9/0/3/0/600_322236912.jpeg',
  banner_link: 'http://static1.squarespace.com/static/56389277e4b0858b30e3754c/57deb2f691b186486926e0a4/57deb30091b186486926e4ad/1474212608718/sf-front-door.jpg?format=original'
)


FoodItem.create(
  name: 'Fried Rice (BBQ Pork)',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/3Pq7zabdZ77snxbT9iVPmHWm10s=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/526.jpg',
  side_dish: true
)

FoodItem.create(
  name: 'Vegetable Fried Rice',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/3Pq7zabdZ77snxbT9iVPmHWm10s=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/526.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Chow Mein (Combination)',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/s3BTtDdHMdw-z-x5kl9rsRkGido=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/534.jpg',
  side_dish: true
)

FoodItem.create(
  name: 'Vegetable Chow Mein',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/s3BTtDdHMdw-z-x5kl9rsRkGido=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/534.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Dried Scallops & Egg White Fried Rice',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/YnHu9wZddQdiEPnflmJJVDh7b3M=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/530.jpg',
  side_dish: true
)

FoodItem.create(
  name: 'Bok Choy',
  restaurant_id: rng.id,
  photo_link: 'http://www.steamykitchen.com/wp-content/uploads/2013/04/bok-choy-with-ground-chicken-stir-fry-recipe-1633.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Sauteed Prawns in X.O. Sauce',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/86lVAGc3h5Js2BDeRysLE3uuvIk=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/554.jpg'
)

FoodItem.create(
  name: 'Mongolian Beef',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/OzOVLY5DVOvrTKDhd3qA4XLTIH8=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/561.jpg'
)

FoodItem.create(
  name: 'Prawns with Honey Walnuts',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/i5L2khzclk3Yo88LtFgNuuh5oVg=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/512.jpg'
)

FoodItem.create(
  name: 'Lemon Chicken',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/fekgBjmQM-KaLnGjPN63WEi8ScA=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/524.jpg'
)

FoodItem.create(
  name: 'Mixed Vegetable Deluxe',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/ZkTtlfxiH_YQHAq5YaqkXtrfdUE=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/578.jpg',
  vegetarian: true
)

FoodItem.create(
  name: 'Peking Duck',
  restaurant_id: rng.id,
  photo_link: 'https://img.trycaviar.com/SL1q-N-0HiK4IOfN4Q68aDuCRf4=/1196x795/https://s3.amazonaws.com/trycaviar.com/offers/17/525.jpg',
)

FoodItem.create(
  name: 'Snow Pea Leaves',
  restaurant_id: rng.id,
  photo_link: 'http://thewoksoflife.com/wp-content/uploads/2013/06/watercress-stirfry.jpg',
  vegetarian: true
)
