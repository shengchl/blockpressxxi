require File.dirname(__FILE__) + '/spec_helper.rb'

describe 'BipMnemonic class' do
  context 'generates correct' do
    it 'mnemonic for entropy 00000000000000000000000000000000' do
      expect(BipMnemonic.to_mnemonic(entropy: '00000000000000000000000000000000')).to eql 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about'
    end
    it 'entropy for mnemonic "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about')).to eq '00000000000000000000000000000000'
    end
    it 'mnemonic for entropy 7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' do
      expect(BipMnemonic.to_mnemonic(entropy: '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f')).to eql 'legal winner thank year wave sausage worth useful legal winner thank yellow'
    end
    it 'entropy for mnemonic "legal winner thank year wave sausage worth useful legal winner thank yellow"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'legal winner thank year wave sausage worth useful legal winner thank yellow')).to eq '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f'
    end
    it 'mnemonic for entropy 80808080808080808080808080808080' do
      expect(BipMnemonic.to_mnemonic(entropy: '80808080808080808080808080808080')).to eql 'letter advice cage absurd amount doctor acoustic avoid letter advice cage above'
    end
    it 'entropy for mnemonic "letter advice cage absurd amount doctor acoustic avoid letter advice cage above"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'letter advice cage absurd amount doctor acoustic avoid letter advice cage above')).to eq '80808080808080808080808080808080'
    end
    it 'mnemonic for entropy ffffffffffffffffffffffffffffffff' do
      expect(BipMnemonic.to_mnemonic(entropy: 'ffffffffffffffffffffffffffffffff')).to eql 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo wrong'
    end
    it 'entropy for mnemonic "zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo wrong"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo wrong')).to eq 'ffffffffffffffffffffffffffffffff'
    end
    it 'mnemonic for entropy 000000000000000000000000000000000000000000000000' do
      expect(BipMnemonic.to_mnemonic(entropy: '000000000000000000000000000000000000000000000000')).to eql 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon agent'
    end
    it 'entropy for mnemonic "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon agent"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon agent')).to eq '000000000000000000000000000000000000000000000000'
    end
    it 'mnemonic for entropy 7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' do
      expect(BipMnemonic.to_mnemonic(entropy: '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f')).to eql 'legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal will'
    end
    it 'entropy for mnemonic "legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal will"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal will')).to eq '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f'
    end
    it 'mnemonic for entropy 808080808080808080808080808080808080808080808080' do
      expect(BipMnemonic.to_mnemonic(entropy: '808080808080808080808080808080808080808080808080')).to eql 'letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter always'
    end
    it 'entropy for mnemonic "letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter always"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter always')).to eq '808080808080808080808080808080808080808080808080'
    end
    it 'mnemonic for entropy ffffffffffffffffffffffffffffffffffffffffffffffff' do
      expect(BipMnemonic.to_mnemonic(entropy: 'ffffffffffffffffffffffffffffffffffffffffffffffff')).to eql 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo when'
    end
    it 'entropy for mnemonic "zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo when"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo when')).to eq 'ffffffffffffffffffffffffffffffffffffffffffffffff'
    end
    it 'mnemonic for entropy 0000000000000000000000000000000000000000000000000000000000000000' do
      expect(BipMnemonic.to_mnemonic(entropy: '0000000000000000000000000000000000000000000000000000000000000000')).to eql 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art'
    end
    it 'entropy for mnemonic "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art')).to eq '0000000000000000000000000000000000000000000000000000000000000000'
    end
    it 'mnemonic for entropy 7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f' do
      expect(BipMnemonic.to_mnemonic(entropy: '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f')).to eql 'legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth title'
    end
    it 'entropy for mnemonic "legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth title"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth title')).to eq '7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f'
    end
    it 'mnemonic for entropy 8080808080808080808080808080808080808080808080808080808080808080' do
      expect(BipMnemonic.to_mnemonic(entropy: '8080808080808080808080808080808080808080808080808080808080808080')).to eql 'letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic bless'
    end
    it 'entropy for mnemonic "letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic bless"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic bless')).to eq '8080808080808080808080808080808080808080808080808080808080808080'
    end
    it 'mnemonic for entropy ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff' do
      expect(BipMnemonic.to_mnemonic(entropy: 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff')).to eql 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo vote'
    end
    it 'entropy for mnemonic "zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo vote"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo vote')).to eq 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'
    end
    it 'mnemonic for entropy 9e885d952ad362caeb4efe34a8e91bd2' do
      expect(BipMnemonic.to_mnemonic(entropy: '9e885d952ad362caeb4efe34a8e91bd2')).to eql 'ozone drill grab fiber curtain grace pudding thank cruise elder eight picnic'
    end
    it 'entropy for mnemonic "ozone drill grab fiber curtain grace pudding thank cruise elder eight picnic"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'ozone drill grab fiber curtain grace pudding thank cruise elder eight picnic')).to eq '9e885d952ad362caeb4efe34a8e91bd2'
    end
    it 'mnemonic for entropy 6610b25967cdcca9d59875f5cb50b0ea75433311869e930b' do
      expect(BipMnemonic.to_mnemonic(entropy: '6610b25967cdcca9d59875f5cb50b0ea75433311869e930b')).to eql 'gravity machine north sort system female filter attitude volume fold club stay feature office ecology stable narrow fog'
    end
    it 'entropy for mnemonic "gravity machine north sort system female filter attitude volume fold club stay feature office ecology stable narrow fog"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'gravity machine north sort system female filter attitude volume fold club stay feature office ecology stable narrow fog')).to eq '6610b25967cdcca9d59875f5cb50b0ea75433311869e930b'
    end
    it 'mnemonic for entropy 68a79eaca2324873eacc50cb9c6eca8cc68ea5d936f98787c60c7ebc74e6ce7c' do
      expect(BipMnemonic.to_mnemonic(entropy: '68a79eaca2324873eacc50cb9c6eca8cc68ea5d936f98787c60c7ebc74e6ce7c')).to eql 'hamster diagram private dutch cause delay private meat slide toddler razor book happy fancy gospel tennis maple dilemma loan word shrug inflict delay length'
    end
    it 'entropy for mnemonic "hamster diagram private dutch cause delay private meat slide toddler razor book happy fancy gospel tennis maple dilemma loan word shrug inflict delay length"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'hamster diagram private dutch cause delay private meat slide toddler razor book happy fancy gospel tennis maple dilemma loan word shrug inflict delay length')).to eq '68a79eaca2324873eacc50cb9c6eca8cc68ea5d936f98787c60c7ebc74e6ce7c'
    end
    it 'mnemonic for entropy c0ba5a8e914111210f2bd131f3d5e08d' do
      expect(BipMnemonic.to_mnemonic(entropy: 'c0ba5a8e914111210f2bd131f3d5e08d')).to eql 'scheme spot photo card baby mountain device kick cradle pact join borrow'
    end
    it 'entropy for mnemonic "scheme spot photo card baby mountain device kick cradle pact join borrow"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'scheme spot photo card baby mountain device kick cradle pact join borrow')).to eq 'c0ba5a8e914111210f2bd131f3d5e08d'
    end
    it 'mnemonic for entropy 6d9be1ee6ebd27a258115aad99b7317b9c8d28b6d76431c3' do
      expect(BipMnemonic.to_mnemonic(entropy: '6d9be1ee6ebd27a258115aad99b7317b9c8d28b6d76431c3')).to eql 'horn tenant knee talent sponsor spell gate clip pulse soap slush warm silver nephew swap uncle crack brave'
    end
    it 'entropy for mnemonic "horn tenant knee talent sponsor spell gate clip pulse soap slush warm silver nephew swap uncle crack brave"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'horn tenant knee talent sponsor spell gate clip pulse soap slush warm silver nephew swap uncle crack brave')).to eq '6d9be1ee6ebd27a258115aad99b7317b9c8d28b6d76431c3'
    end
    it 'mnemonic for entropy 9f6a2878b2520799a44ef18bc7df394e7061a224d2c33cd015b157d746869863' do
      expect(BipMnemonic.to_mnemonic(entropy: '9f6a2878b2520799a44ef18bc7df394e7061a224d2c33cd015b157d746869863')).to eql 'panda eyebrow bullet gorilla call smoke muffin taste mesh discover soft ostrich alcohol speed nation flash devote level hobby quick inner drive ghost inside'
    end
    it 'entropy for mnemonic "panda eyebrow bullet gorilla call smoke muffin taste mesh discover soft ostrich alcohol speed nation flash devote level hobby quick inner drive ghost inside"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'panda eyebrow bullet gorilla call smoke muffin taste mesh discover soft ostrich alcohol speed nation flash devote level hobby quick inner drive ghost inside')).to eq '9f6a2878b2520799a44ef18bc7df394e7061a224d2c33cd015b157d746869863'
    end
    it 'mnemonic for entropy 23db8160a31d3e0dca3688ed941adbf3' do
      expect(BipMnemonic.to_mnemonic(entropy: '23db8160a31d3e0dca3688ed941adbf3')).to eql 'cat swing flag economy stadium alone churn speed unique patch report train'
    end
    it 'entropy for mnemonic "cat swing flag economy stadium alone churn speed unique patch report train"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'cat swing flag economy stadium alone churn speed unique patch report train')).to eq '23db8160a31d3e0dca3688ed941adbf3'
    end
    it 'mnemonic for entropy 8197a4a47f0425faeaa69deebc05ca29c0a5b5cc76ceacc0' do
      expect(BipMnemonic.to_mnemonic(entropy: '8197a4a47f0425faeaa69deebc05ca29c0a5b5cc76ceacc0')).to eql 'light rule cinnamon wrap drastic word pride squirrel upgrade then income fatal apart sustain crack supply proud access'
    end
    it 'entropy for mnemonic "light rule cinnamon wrap drastic word pride squirrel upgrade then income fatal apart sustain crack supply proud access"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'light rule cinnamon wrap drastic word pride squirrel upgrade then income fatal apart sustain crack supply proud access')).to eq '8197a4a47f0425faeaa69deebc05ca29c0a5b5cc76ceacc0'
    end
    it 'mnemonic for entropy 066dca1a2bb7e8a1db2832148ce9933eea0f3ac9548d793112d9a95c9407efad' do
      expect(BipMnemonic.to_mnemonic(entropy: '066dca1a2bb7e8a1db2832148ce9933eea0f3ac9548d793112d9a95c9407efad')).to eql 'all hour make first leader extend hole alien behind guard gospel lava path output census museum junior mass reopen famous sing advance salt reform'
    end
    it 'entropy for mnemonic "all hour make first leader extend hole alien behind guard gospel lava path output census museum junior mass reopen famous sing advance salt reform"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'all hour make first leader extend hole alien behind guard gospel lava path output census museum junior mass reopen famous sing advance salt reform')).to eq '066dca1a2bb7e8a1db2832148ce9933eea0f3ac9548d793112d9a95c9407efad'
    end
    it 'mnemonic for entropy f30f8c1da665478f49b001d94c5fc452' do
      expect(BipMnemonic.to_mnemonic(entropy: 'f30f8c1da665478f49b001d94c5fc452')).to eql 'vessel ladder alter error federal sibling chat ability sun glass valve picture'
    end
    it 'entropy for mnemonic "vessel ladder alter error federal sibling chat ability sun glass valve picture"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'vessel ladder alter error federal sibling chat ability sun glass valve picture')).to eq 'f30f8c1da665478f49b001d94c5fc452'
    end
    it 'mnemonic for entropy c10ec20dc3cd9f652c7fac2f1230f7a3c828389a14392f05' do
      expect(BipMnemonic.to_mnemonic(entropy: 'c10ec20dc3cd9f652c7fac2f1230f7a3c828389a14392f05')).to eql 'scissors invite lock maple supreme raw rapid void congress muscle digital elegant little brisk hair mango congress clump'
    end
    it 'entropy for mnemonic "scissors invite lock maple supreme raw rapid void congress muscle digital elegant little brisk hair mango congress clump"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'scissors invite lock maple supreme raw rapid void congress muscle digital elegant little brisk hair mango congress clump')).to eq 'c10ec20dc3cd9f652c7fac2f1230f7a3c828389a14392f05'
    end
    it 'mnemonic for entropy f585c11aec520db57dd353c69554b21a89b20fb0650966fa0a9d6f74fd989d8f' do
      expect(BipMnemonic.to_mnemonic(entropy: 'f585c11aec520db57dd353c69554b21a89b20fb0650966fa0a9d6f74fd989d8f')).to eql 'void come effort suffer camp survey warrior heavy shoot primary clutch crush open amazing screen patrol group space point ten exist slush involve unfold'
    end
    it 'entropy for mnemonic "void come effort suffer camp survey warrior heavy shoot primary clutch crush open amazing screen patrol group space point ten exist slush involve unfold"' do
      expect(BipMnemonic.to_entropy(mnemonic: 'void come effort suffer camp survey warrior heavy shoot primary clutch crush open amazing screen patrol group space point ten exist slush involve unfold')).to eq 'f585c11aec520db57dd353c69554b21a89b20fb0650966fa0a9d6f74fd989d8f'
    end
  end
  context 'correct count of mnemonic words for' do
    it '128 bits' do
      expect(BipMnemonic.to_mnemonic(bits: 128).split.count).to eq 12
    end
    it '192 bits' do
      expect(BipMnemonic.to_mnemonic(bits: 192).split.count).to eq 18
    end
    it '256 bits' do
      expect(BipMnemonic.to_mnemonic(bits: 256).split.count).to eq 24
    end
    it '320 bits' do
      expect(BipMnemonic.to_mnemonic(bits: 320).split.count).to eq 30
    end
    it '384 bits' do
      expect(BipMnemonic.to_mnemonic(bits: 384).split.count).to eq 36
    end
    it '448 bits' do
      expect(BipMnemonic.to_mnemonic(bits: 448).split.count).to eq 42
    end
    it '512 bits' do
      expect(BipMnemonic.to_mnemonic(bits: 512).split.count).to eq 48
    end
  end
  context 'does not generate same words for 128 bits for ' do
    it '10 iterations' do
      expect(10.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:128) }.uniq.count).to eq 10
    end
    it '50 iterations' do
      expect(50.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:128) }.uniq.count).to eq 50
    end
    it '100 iterations' do
      expect(100.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:128) }.uniq.count).to eq 100
    end
    it '2048 iterations' do
      expect(2048.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:128) }.uniq.count).to eq 2048
    end
  end
  context 'does not generate same words for 256 bits for ' do
    it '10 iterations' do
      expect(10.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:256) }.uniq.count).to eq 10
    end
    it '50 iterations' do
      expect(50.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:256) }.uniq.count).to eq 50
    end
    it '100 iterations' do
      expect(100.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:256) }.uniq.count).to eq 100
    end
    it '2048 iterations' do
      expect(2048.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:256) }.uniq.count).to eq 2048
    end
  end
  context 'does not generate same words for 512 bits for ' do
    it '10 iterations' do
      expect(10.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:512) }.uniq.count).to eq 10
    end
    it '50 iterations' do
      expect(50.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:512) }.uniq.count).to eq 50
    end
    it '100 iterations' do
      expect(100.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:512) }.uniq.count).to eq 100
    end
    it '2048 iterations' do
      expect(2048.times.inject([]){ |arr| arr << BipMnemonic.to_mnemonic(bits:512) }.uniq.count).to eq 2048
    end
  end
  context 'generates correct seed for' do
    it 'mnemonic "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about')).to eq 'c55257c360c07c72029aebc1b53c05ed0362ada38ead3e3e9efa3708e53495531f09a6987599d18264c1e1c92f2cf141630c7a3c4ab7c81b2f001698e7463b04'
    end
    it 'mnemonic "legal winner thank year wave sausage worth useful legal winner thank yellow"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'legal winner thank year wave sausage worth useful legal winner thank yellow')).to eql '2e8905819b8723fe2c1d161860e5ee1830318dbf49a83bd451cfb8440c28bd6fa457fe1296106559a3c80937a1c1069be3a3a5bd381ee6260e8d9739fce1f607'
    end
    it 'mnemonic "letter advice cage absurd amount doctor acoustic avoid letter advice cage above"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'letter advice cage absurd amount doctor acoustic avoid letter advice cage above')).to eql 'd71de856f81a8acc65e6fc851a38d4d7ec216fd0796d0a6827a3ad6ed5511a30fa280f12eb2e47ed2ac03b5c462a0358d18d69fe4f985ec81778c1b370b652a8'
    end
    it 'mnemonic "zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo wrong"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo wrong')).to eql 'ac27495480225222079d7be181583751e86f571027b0497b5b5d11218e0a8a13332572917f0f8e5a589620c6f15b11c61dee327651a14c34e18231052e48c069'
    end
    it 'mnemonic "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon agent"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon agent')).to eql '035895f2f481b1b0f01fcf8c289c794660b289981a78f8106447707fdd9666ca06da5a9a565181599b79f53b844d8a71dd9f439c52a3d7b3e8a79c906ac845fa'
    end
    it 'mnemonic "legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal will"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal will')).to eql 'f2b94508732bcbacbcc020faefecfc89feafa6649a5491b8c952cede496c214a0c7b3c392d168748f2d4a612bada0753b52a1c7ac53c1e93abd5c6320b9e95dd'
    end
    it 'mnemonic "letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter always"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter always')).to eql '107d7c02a5aa6f38c58083ff74f04c607c2d2c0ecc55501dadd72d025b751bc27fe913ffb796f841c49b1d33b610cf0e91d3aa239027f5e99fe4ce9e5088cd65'
    end
    it 'mnemonic "zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo when"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo when')).to eql '0cd6e5d827bb62eb8fc1e262254223817fd068a74b5b449cc2f667c3f1f985a76379b43348d952e2265b4cd129090758b3e3c2c49103b5051aac2eaeb890a528'
    end
    it 'mnemonic "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art')).to eql 'bda85446c68413707090a52022edd26a1c9462295029f2e60cd7c4f2bbd3097170af7a4d73245cafa9c3cca8d561a7c3de6f5d4a10be8ed2a5e608d68f92fcc8'
    end
    it 'mnemonic "legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth title"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth useful legal winner thank year wave sausage worth title')).to eql 'bc09fca1804f7e69da93c2f2028eb238c227f2e9dda30cd63699232578480a4021b146ad717fbb7e451ce9eb835f43620bf5c514db0f8add49f5d121449d3e87'
    end
    it 'mnemonic "letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic bless"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic avoid letter advice cage absurd amount doctor acoustic bless')).to eql 'c0c519bd0e91a2ed54357d9d1ebef6f5af218a153624cf4f2da911a0ed8f7a09e2ef61af0aca007096df430022f7a2b6fb91661a9589097069720d015e4e982f'
    end
    it 'mnemonic "zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo vote"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo zoo vote')).to eql 'dd48c104698c30cfe2b6142103248622fb7bb0ff692eebb00089b32d22484e1613912f0a5b694407be899ffd31ed3992c456cdf60f5d4564b8ba3f05a69890ad'
    end
    it 'mnemonic "ozone drill grab fiber curtain grace pudding thank cruise elder eight picnic"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'ozone drill grab fiber curtain grace pudding thank cruise elder eight picnic')).to eql '274ddc525802f7c828d8ef7ddbcdc5304e87ac3535913611fbbfa986d0c9e5476c91689f9c8a54fd55bd38606aa6a8595ad213d4c9c9f9aca3fb217069a41028'
    end
    it 'mnemonic "gravity machine north sort system female filter attitude volume fold club stay feature office ecology stable narrow fog"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'gravity machine north sort system female filter attitude volume fold club stay feature office ecology stable narrow fog')).to eql '628c3827a8823298ee685db84f55caa34b5cc195a778e52d45f59bcf75aba68e4d7590e101dc414bc1bbd5737666fbbef35d1f1903953b66624f910feef245ac'
    end
    it 'mnemonic "hamster diagram private dutch cause delay private meat slide toddler razor book happy fancy gospel tennis maple dilemma loan word shrug inflict delay length"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'hamster diagram private dutch cause delay private meat slide toddler razor book happy fancy gospel tennis maple dilemma loan word shrug inflict delay length')).to eql '64c87cde7e12ecf6704ab95bb1408bef047c22db4cc7491c4271d170a1b213d20b385bc1588d9c7b38f1b39d415665b8a9030c9ec653d75e65f847d8fc1fc440'
    end
    it 'mnemonic "scheme spot photo card baby mountain device kick cradle pact join borrow"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'scheme spot photo card baby mountain device kick cradle pact join borrow')).to eql 'ea725895aaae8d4c1cf682c1bfd2d358d52ed9f0f0591131b559e2724bb234fca05aa9c02c57407e04ee9dc3b454aa63fbff483a8b11de949624b9f1831a9612'
    end
    it 'mnemonic "horn tenant knee talent sponsor spell gate clip pulse soap slush warm silver nephew swap uncle crack brave"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'horn tenant knee talent sponsor spell gate clip pulse soap slush warm silver nephew swap uncle crack brave')).to eql 'fd579828af3da1d32544ce4db5c73d53fc8acc4ddb1e3b251a31179cdb71e853c56d2fcb11aed39898ce6c34b10b5382772db8796e52837b54468aeb312cfc3d'
    end
    it 'mnemonic "panda eyebrow bullet gorilla call smoke muffin taste mesh discover soft ostrich alcohol speed nation flash devote level hobby quick inner drive ghost inside"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'panda eyebrow bullet gorilla call smoke muffin taste mesh discover soft ostrich alcohol speed nation flash devote level hobby quick inner drive ghost inside')).to eql '72be8e052fc4919d2adf28d5306b5474b0069df35b02303de8c1729c9538dbb6fc2d731d5f832193cd9fb6aeecbc469594a70e3dd50811b5067f3b88b28c3e8d'
    end
    it 'mnemonic "cat swing flag economy stadium alone churn speed unique patch report train"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'cat swing flag economy stadium alone churn speed unique patch report train')).to eql 'deb5f45449e615feff5640f2e49f933ff51895de3b4381832b3139941c57b59205a42480c52175b6efcffaa58a2503887c1e8b363a707256bdd2b587b46541f5'
    end
    it 'mnemonic "light rule cinnamon wrap drastic word pride squirrel upgrade then income fatal apart sustain crack supply proud access"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'light rule cinnamon wrap drastic word pride squirrel upgrade then income fatal apart sustain crack supply proud access')).to eql '4cbdff1ca2db800fd61cae72a57475fdc6bab03e441fd63f96dabd1f183ef5b782925f00105f318309a7e9c3ea6967c7801e46c8a58082674c860a37b93eda02'
    end
    it 'mnemonic "all hour make first leader extend hole alien behind guard gospel lava path output census museum junior mass reopen famous sing advance salt reform"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'all hour make first leader extend hole alien behind guard gospel lava path output census museum junior mass reopen famous sing advance salt reform')).to eql '26e975ec644423f4a4c4f4215ef09b4bd7ef924e85d1d17c4cf3f136c2863cf6df0a475045652c57eb5fb41513ca2a2d67722b77e954b4b3fc11f7590449191d'
    end
    it 'mnemonic "vessel ladder alter error federal sibling chat ability sun glass valve picture"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'vessel ladder alter error federal sibling chat ability sun glass valve picture')).to eql '2aaa9242daafcee6aa9d7269f17d4efe271e1b9a529178d7dc139cd18747090bf9d60295d0ce74309a78852a9caadf0af48aae1c6253839624076224374bc63f'
    end
    it 'mnemonic "scissors invite lock maple supreme raw rapid void congress muscle digital elegant little brisk hair mango congress clump"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'scissors invite lock maple supreme raw rapid void congress muscle digital elegant little brisk hair mango congress clump')).to eql '7b4a10be9d98e6cba265566db7f136718e1398c71cb581e1b2f464cac1ceedf4f3e274dc270003c670ad8d02c4558b2f8e39edea2775c9e232c7cb798b069e88'
    end
    it 'mnemonic "void come effort suffer camp survey warrior heavy shoot primary clutch crush open amazing screen patrol group space point ten exist slush involve unfold"' do
      expect(BipMnemonic.to_seed(password: 'TREZOR', mnemonic: 'void come effort suffer camp survey warrior heavy shoot primary clutch crush open amazing screen patrol group space point ten exist slush involve unfold')).to eql '01f5bced59dec48e362f2c45b5de68b9fd6c92c6634f44d6d40aab69056506f0e35524a518034ddc1192e1dacd32c1ed3eaa3c3b131c88ed8e7e54c49a5d0998'
    end
  end
end
