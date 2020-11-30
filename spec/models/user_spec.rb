require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it "全ての項目が記入されていると登録できる" do
        expect(@user).to be_valid
      end
      it "メールアドレスが一意性であると登録できる" do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        @user.save
        expect(duplicate_user).to be_invalid
      end
      it "passwordが6文字以上であると登録できる" do
        @user.password = "1a2b3c"
        @user.password_confirmation = "1a2b3c"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録されない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "first_nameが空だと登録されない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = 'hankaku'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で入力してください")    
      end
      it "family_nameが空だと登録されない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.family_name = 'hankaku'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name は全角で入力してください")
      end
      it "first_name_kanaが空だと登録されない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaは全角カタカナでないと登録できない" do
        @user.first_name_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください")
      end
      it "family_name_kanaが空だと登録されない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaは全角タカナでないと登録できない" do
        @user.family_name_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana は全角カタカナで入力してください")
      end
      it "birthdayが空だと登録されない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性ではないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠が含まれていないと登録できない" do
        @user.email = "testgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email は＠が含まれていません")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは半角英数字混合でないと登録されない(英数字のみ)" do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end
      it "passwordは半角英数字混合でないと登録されない(数字のみ)" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "1a2b3"
        @user.password_confirmation = "1a2b3"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在しても、password_confirmが空では保存できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "1a2b3c"
        @user.password_confirmation = "1a2b3c4"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
