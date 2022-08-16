class Genre < ActiveHash::Base
  self.data = [
    {id: 0, name: '---'},
    {id: 1, name: '学園漫画'},
    {id: 2, name: 'ギャグ漫画'},
    {id: 3, name: 'ファンタジー漫画'},
    {id: 4, name: 'SF漫画'},
    {id: 5, name: 'ホラー漫画'},
    {id: 6, name: '恋愛漫画'},
    {id: 7, name: 'スポーツ漫画'},
    {id: 8, name: '音楽漫画'},
    {id: 9, name: '料理漫画'},
    {id: 10, name: '推理漫画'},
    {id: 11, name: '医療漫画'},
    {id: 12, name: '格闘漫画'},
    {id: 13, name: '歴史漫画'},
    {id: 14, name: 'エッセイ漫画'},
    {id: 15, name: 'レポート漫画'}
  ]

  include ActiveHash::Associations
  has_many :comics

end