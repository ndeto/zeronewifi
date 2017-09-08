# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Campaign.create(name:'imagecampaign', display:'Image')
Campaign.create(name:'videocampaign', display:'Video')
Campaign.create(name:'pollcampaign', display:'Poll')



ContactType.create(display:'Email', name:'email', description:'Require Email')
ContactType.create(display:'Email',name:'phone', description:'Require Phone Number')
ContactType.create(display:'Email',name:'none', description:'Require No Contacts')