class CreateNormalizationWeights < ActiveRecord::Migration[7.0]
  def change
    create_table :normalization_weights do |t|

      t.timestamps
    end
  end
end
