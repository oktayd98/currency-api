# == Schema Information
#
# Table name: conversation_pairs
#
#  id         :bigint           not null, primary key
#  rate       :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  base_id    :bigint           not null
#  target_id  :bigint           not null
#
# Indexes
#
#  index_conversation_pairs_on_base_id    (base_id)
#  index_conversation_pairs_on_target_id  (target_id)
#
# Foreign Keys
#
#  fk_rails_...  (base_id => currencies.id)
#  fk_rails_...  (target_id => currencies.id)
#
require "test_helper"

class ConversationPairTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
