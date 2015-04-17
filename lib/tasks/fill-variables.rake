namespace :db do
  desc "Заполняем БД данными общими переменными."
  task :variables => :environment do
    # Чистим
    Siteconfig.delete(Siteconfig.all)
    # Заполняем
    Siteconfig.create(name:  "title", 
                      value: 'ООО "ЭДАС"')  
    Siteconfig.create(name:  "name", 
                      value: 'ООО "ЭДАС"')  
    # краткое описание
    Siteconfig.create(name:  "caption", 
                      value: 'ПРОЕКТНО-МОНТАЖНАЯ КОМПАНИЯ')  
    # строка адреса 1
    Siteconfig.create(name:  "address1", 
                      value: '614077, г. Пермь,')  
    # строка адреса 2
    Siteconfig.create(name:  "address2", 
                      value: 'бульвар Гагарина, 65а/1 оф. 156')  
    # строка с емайлом
    Siteconfig.create(name:  "email", 
                      value: '<a href="mailto:edas-perm@yandex.ru">edas-perm@yandex.ru</a>')  
    # строка с телефонами
    Siteconfig.create(name:  "phone_footer", 
                      value: '<abbr title="Телефон:">Телефон:</abbr>
          +7 (342) 257-20-88     <br> 
          <abbr title="Мобильный телефон:">Моб.тел.:</abbr>
          +7 (902) 835-17-41')  
    # - phone_header - string(100)
    Siteconfig.create(name:  "phone_header", 
                      value: '+7 (342) 257-20-88')  
    # - logo  - te
    Siteconfig.create(name:  "logo", 
                      value: '<p> Design by <b>
                      <a href="mailto:schis-pm@yandex.ru">PawelShi</a>
                      </b> </p>
        <a href="http://beget.ru?id=78219" target="_blank">
          <img src="http://www.beget.ru/banners/001.gif" border="0">
        </a>')  


    # Rake::Task['db:reset'].invoke
    # User.create!(:name => "Example User",
    #              :email => "example@railstutorial.org",
    #              :password => "foobar",
    #              :password_confirmation => "foobar")
    # 99.times do |n|
    #   name  = Faker::Name.name
    #   email = "example-#{n+1}@railstutorial.org"
    #   password  = "password"
    #   User.create!(:name => name,
    #                :email => email,
    #                :password => password,
    #                :password_confirmation => password)
    # end
  end
end