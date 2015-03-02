module Models

	module Fields

		extend ActiveSupport::Concern

		# Функции настройки полей моделей
		FIELDS_INFO = {id: {title: 'Ид', caption: 'Идентификатор записи' },
                created_at: {title: 'Дата создания', caption: 'Дата создания записи'},
                updated_at: {title: 'Дата изменения', caption: 'Дата последнего изменения записи'}
              }
		def self.set_fields_name(*args)
			@@fields_info = FIELDS_INFO.merge(args[0])
		end

		def get_fields_name
			@@fields_info
		end

	end
end