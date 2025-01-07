class Post < ApplicationRecord
  attribute :souvenir_name, :string 
  #疑似的なカラムを追加してカラムにない情報をモデルに渡す
  before_validation :insert_souvenir_id
  #ヴァリデーションの前にメソッドを実行
  after_touch :insert_souvenir_name
  #データベースから読み込んだ後メソッドを実行

  belongs_to :user
  belongs_to :category
  belongs_to :souvenir
  belongs_to :prefecture

  validates :caption, presence: true

  has_one_attached :image
  validates :image, content_type: ['image/png', 'image/jpeg', 'image/jpg']

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user&.id)
    #favorited_by?メソッドでユーザーidがfavoritesテーブル内に存在するかどうかを判別しています。（いいねを既に押しているか、押していないか）
  end



  private
  
  def insert_souvenir_id
    souvenir = Souvenir.find_or_create_by(name: self.souvenir_name)
    #入力されたsouvenir_nameからレコードが存在する場合はfind_by,存在しなければcreateを実行する
    self.souvenir = souvenir
    #postクラスのインスタンス
  end

  def insert_souvenir_name
    souvenir = Souvenir.find_by(id: self.souvenir_id)
    #souvenirのインスタンス呼び出し
    self.souvenir_name = souvenir.name if souvenir
    #sopuvenir_nameに文字列を渡している
  end
end
