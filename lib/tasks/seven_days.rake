namespace :quelin do
	desc "If Service end date exist -14 days foreach service"

	task :fourteen_days => :environment do 

		# wywołuje serwisy

		@service = Service.all

		# wyciągam serwisy z datą zakończenia serwisu oraz odejmuje od tego 14 dni

		@service.each do |smt|
			
			if smt.end_date?

			x =	smt.try(:end_date).try(:to_date) - 14.days


		# jeśli data serwisu minus 14 dni (powyżej) jest taka sama jak date now podejmuj akcje
				if x == DateTime.now.to_date


					RemindMailer.weekly(smt).deliver


				end

			end
		end




	end
	end