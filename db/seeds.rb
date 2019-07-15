Order.delete_all
# Product.delete_all
# Category.delete_all

cat_1 = Category.create! name: "fish_category_1"
cat_2 = Category.create! name: "fish_category_2"

file_1  = File.open(File.join(Rails.root,'app/assets/images/other/pro-1.jpg'))
file_2 = File.open(File.join(Rails.root,'app/assets/images/other/pro-2.jpg'))
file_3 = File.open(File.join(Rails.root,'app/assets/images/other/pro-3.jpg'))

pro_1 = Product.create! name: "red_fish", piece_price: 11.0, kilo_price: 42.5, active: true , category: cat_1
pro_2 = Product.create! name: "blue_fish", piece_price: 18.29, kilo_price: 60.0, active: true , category: cat_2

pro_1.product_images.build(image: file_1)
pro_2.product_images.build(image: file_2)
pro_3.product_images.build(image: file_3)

pro_1.save!
pro_2.save!
pro_3.save!

About.first_or_create! body: "Oلقد أصبحنا مقتنعين بأن الفوائد الصحية للمأكولات البحرية الطازجة للبشرية مهمة جدا إلى حد كبير فلا نسمح  لممارسات المطاعم والشيف ان يفقدنا الاستمتاع بطعم السمك الطازج بكثره الصلصات والتوابل عليها نحن نريد أن نترك سحر الأسماك مقرون بيوم السمك ,
البحرهو السمك الطازج ورائحته وهذا هو منتج يوم السمك نحن نقدم خدمة التوصيل من أعلى مستويات الجودة والمعايير نقدم لك: وسيلة مريحة لتشمل خيار صحيا من الأسماك الطازجة، والمأكولات البحرية، وتسليمها لباب منزلك من يوم صيدها من قبل موضفينا بشحن ومعامل التنظيف. لدينا تشكيلة كبيرة من المأكولات جنبا إلى جنب مع فريق من ذوي الخبرة لدينا، وهم يعرفون ما الذي تبحث عنه نحن نقدم الأسماك الطازجة والمأكولات البحرية مباشرة إلى الباب الخاص بك. متجر اسماك  على شبكة الإنترنت، يسمح لك أن تأمر بسرعة وبشكل آمن. للأسماك والمأكولات البحرية
"
Meter.first_or_create! percentage: 100 unless Meter.count >= 1

City.first_or_create(name: 'الرياض')