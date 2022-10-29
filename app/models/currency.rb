# == Schema Information
#
# Table name: currencies
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Currency < ApplicationRecord
  has_many :base_conversation_pairs, class_name: "ConversationPair", foreign_key: "base_id", dependent: :destroy
  has_many :target_conversation_pairs, class_name: "ConversationPair", foreign_key: "target_id", dependent: :destroy
end
