  task :add_apple_to_basket,[:apple_count, :variety] do |task, args|
    method_name
    if Basket.all.count != 50
      Basket.destroy_all
      for nbasket in 1..50
        capacity = rand(2..27)
        Basket.create(capacity: capacity)
      end
    end

    given_apple_count = args.apple_count.blank? ? 0 : args.apple_count
    given_variety = args.variety.blank? ? '' : args.variety

    basket_ids_with_apples_count_hash = Apple.all.select('basket_id, COUNT(basket_id), variety').where(:variety=>given_variety).order(:count).pluck(:basket_id, :count).to_h
    baskets_with_zero_apple = Basket.select('id').where.not('id IN (?)',basket_ids_with_apples_count_hash.keys.to_a)
    basket_with_capacity_hash = Basket.all.pluck(:id,:capacity).to_h

    if(!baskets_with_zero_apple.blank?)
      available_basket_ids = baskets_with_zero_apple
    else
      basket_ids_with_apples_count_hash.keys.to_a.uniq.each do |each_obj|
        if(basket_ids_with_apples_count_hash[each_obj] >= basket_with_capacity_hash[each_obj])
          basket_ids_with_apples_count_hash.delete(each_obj)
        end
      end

      if basket_ids_with_apples_count_hash.empty?()
        return "All baskets are full. We couldn't find the place for #{given_apple_count} apples"
      else
        available_basket_ids = basket_ids_with_apples_count_hash.keys.to_a
      end
    end


    available_basket_ids.each do |each_obj|
      if(given_apple_count != 0)
        count_apples_can_be_filled = basket_with_capacity_hash[each_obj] - basket_ids_with_apples_count_hash[each_obj]
        if(given_apple_count <= count_apples_can_be_filled)
          count_apples_can_be_filled = given_apple_count
          given_apple_count = fill_apple_recalculate(each_obj, given_variety, count_apples_can_be_filled, given_apple_count)
        else
          given_apple_count = fill_apple_recalculate(each_obj, given_variety, count_apples_can_be_filled, given_apple_count)
        end
      else
        break
      end
    end

  end

  def fill_apple_recalculate(each_obj, given_variety, count_apples_can_be_filled, given_apple_count)
    given_apple_count -= count_apples_can_be_filled
    for n in 1..given_apple_count
      Apple.create(basket_id: each_obj, variety: given_variety)
    end
    total_apples = Apple.where(:basket_id=> each_obj).count
    basket = Basket.find(each_obj)
    fill_rate = (total_apples/basket.capacity) * 100
    basket.update(:fill_rate=>fill_rate)
    return given_apple_count
  end

