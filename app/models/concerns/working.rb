module Working
  extend ActiveSupport::Concern

  def enemy?
    status == '0'
  end

  class_methods do
    def squad_size
      where(department: 'Player').where(status: '1').count
    end

    def foreigner_count
      where.not(nation: 'Türkiye').where(department: 'Player').where(status: '1').count
    end
  end
end
