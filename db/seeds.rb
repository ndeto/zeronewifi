User.create!([
  {:username => 'John Doe', :email => 'test@gmail.com', :password => 'testtest', :password_confirmation => 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2017-08-28 11:13:54", last_sign_in_at: "2017-08-10 19:56:50", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: "Fui73NddqurLp84sQkjB", confirmed_at: "2017-07-31 19:43:21", confirmation_sent_at: "2017-07-31 19:42:42", unconfirmed_email: nil, username: nil, avatar_file_name: "ad.mp4", avatar_content_type: "video/mp4", avatar_file_size: 21907745, avatar_updated_at: "2017-08-04 23:28:47"}
])
Store.create!([
  {:store_name => 'Our Store', :email => 'test@gmail.com', :password => 'testtest', :password_confirmation => 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 15, current_sign_in_at: "2017-09-19 08:38:44", last_sign_in_at: "2017-09-19 08:38:42", current_sign_in_ip: "192.168.7.240", last_sign_in_ip: "192.168.7.239", user_id: 8, username: "mndeto", key: "123", store_name: "ndeto", activecamp: nil, active: true, contact_type: nil},
])
Campaign.create!([
  {name: "imagecampaign", display: "Image"},
  {name: "videocampaign", display: "Video"},
  {name: "pollcampaign", display: "Poll"}
])
Contact.create!([
  {store_id: 1, phone: 724040839, date: "2017-08-11"},
  {store_id: 1, phone: 724040839, date: "2017-08-11"},
  {store_id: 1, phone: 724040839, date: "2017-08-11"},
  {store_id: 1, phone: 724040839, date: "2017-08-11"},
  {store_id: 1, phone: 724040839, date: "2017-08-11"},
  {store_id: 1, phone: 724040839, date: "2017-09-14"},
  {store_id: 1, phone: 724040839, date: "2017-09-14"},
  {store_id: 1, phone: 724040839, date: "2017-09-14"},
  {store_id: 1, phone: 724040839, date: "2017-08-11"},
  {store_id: 1, phone: 724292333, date: "2017-09-19"},
  {store_id: 1, phone: 724292333, date: "2017-09-19"},
  {store_id: 1, phone: 708925621, date: "2017-09-19"},
  {store_id: 1, phone: 724292333, date: "2017-09-19"},
  {store_id: 1, phone: 723231652, date: "2017-09-19"},
  {store_id: 1, phone: 711109728, date: "2017-09-19"}
])
ContactType.create!([
  {name: "email", description: "Require Email", display: "Email"},
  {name: "phone", description: "Require Phone Number", display: "Phone"},
  {name: "none", description: "Require No Contacts", display: "None"}
])
StoreCampaign.create!([
                          {campaign_id: 1, name: "Polly", store_id: 1, sponsored_text_status: false, sponsored_text: "", campaign_text_status: true, campaign_text: "Welcome to Java", media: "javahouse.jpg", splashpage_status: true, contact_type_id: 2, splashimage: "javahouse.jpg", background_color: "#1f2230", background: "color", bg_img: "istock-466472771.jpg", splashimage_opacity: "0.8", video_file_name: nil, video_content_type: nil, video_file_size: nil, video_updated_at: nil},
                          {campaign_id: 1, name: "First", store_id: 1, sponsored_text_status: false, sponsored_text: "", campaign_text_status: true, campaign_text: "Welcome to Java TRM", media: "javahouse.jpg", splashpage_status: true, contact_type_id: nil, splashimage: "javahouse.jpg", background_color: "#FFF", background: "image", bg_img: "istock-466472771.jpg", splashimage_opacity: "0.5", video_file_name: nil, video_content_type: nil, video_file_size: nil, video_updated_at: nil},
                          {campaign_id: 1, name: "Test", store_id: 1, sponsored_text_status: false, sponsored_text: "", campaign_text_status: true, campaign_text: "Welcome to Java TRM", media: "Plain-Logo.png", splashpage_status: false, contact_type_id: nil, splashimage: "Plain-Logo-white.png", background_color: "#FFF", background: "color", bg_img: nil, splashimage_opacity: "0.5", video_file_name: nil, video_content_type: nil, video_file_size: nil, video_updated_at: nil},
                          {campaign_id: 2, name: "Peppinos Video", store_id: 1, sponsored_text_status: true, sponsored_text: "Welcome to Peppinos, Enjoy the free wifi", campaign_text_status: true, campaign_text: "I love it!", media: nil, splashpage_status: true, contact_type_id: nil, splashimage: "javahouse.jpg", background_color: "#000000", background: "image", bg_img: "istock-466472771.jpg", splashimage_opacity: "0.6", video_file_name: "Java_House.mp4", video_content_type: "video/mp4", video_file_size: 17562376, video_updated_at: "2017-08-23 09:57:21"},
                          {campaign_id: 1, name: "Sponsored", store_id: 1, sponsored_text_status: nil, sponsored_text: nil, campaign_text_status: true, campaign_text: "Welcome to ndeto", media: nil, splashpage_status: false, contact_type_id: nil, splashimage: nil, background_color: "#FFF", background: "color", bg_img: nil, splashimage_opacity: nil, video_file_name: nil, video_content_type: nil, video_file_size: nil, video_updated_at: nil},
                          {campaign_id: 3, name: "Poll", store_id: 1, sponsored_text_status: true, sponsored_text: "Enjoy the Free Wi-Fi courtesy of C-NET", campaign_text_status: true, campaign_text: "Please provide us your feedback", media: nil, splashpage_status: true, contact_type_id: nil, splashimage: "motd.jpg", background_color: "#6e3232", background: "image", bg_img: "istock-466472771.jpg", splashimage_opacity: "0.9", video_file_name: nil, video_content_type: nil, video_file_size: nil, video_updated_at: nil},
                          {campaign_id: 2, name: "Funny Video", store_id: 1, sponsored_text_status: true, sponsored_text: "Free Wi-Fi powered by C-NET", campaign_text_status: true, campaign_text: "Welcome to Java Garden City", media: nil, splashpage_status: false, contact_type_id: 1, splashimage: nil, background_color: "#000000", background: "image", bg_img: "istock-466472771.jpg", splashimage_opacity: "0.5", video_file_name: "_unhappyHusband_mini_clip_1.mp4", video_content_type: "video/mp4", video_file_size: 2464299, video_updated_at: "2017-09-21 07:36:32"}
                      ])

Question.create!([
  {question: "What's your favourite drink in Java?", feedback: nil, store_campaign_id: 6}
                 ])
PollAnswer.create!([
  {count: 1, question_id: 1, answer: "Mocha"},
  {count: 0, question_id: 1, answer: "Cappucinno"},
  {count: 0, question_id: 1, answer: "Espresso"},
  {count: 0, question_id: 1, answer: "Tea"}
])

Store.find(1).update({
                         store_campaign_id:1
                     })

