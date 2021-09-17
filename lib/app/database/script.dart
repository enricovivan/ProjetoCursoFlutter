final createTable = '''
  CREATE TABLE pratos(
    id INT NOT NULL PRIMARY KEY,
    nomePrato VARCHAR(200) NOT NULL,
    quantia VARCHAR(30) NOT NULL,
    url_avatar VARCHAR(500) NOT NULL,
  )
''';

final insert1 = '''
  INSERT INTO contact (nomePrato, quantia, url_avatar)
  VALUES ('Steak Tartare', '2 Pratos', 'https://www.lowcarbnikki.com/wp-content/uploads/2019/08/20190611_203100.jpg');
''';

final insert2 = '''
  INSERT INTO contact (nomePrato, quantia, url_avatar)
  VALUES ('Pidan', '4 Porções', 'https://www.onlinepasar.com.my/wp-content/uploads/2020/02/Century-Egg-Pidan.jpg');
''';

final insert3 = '''
  INSERT INTO contact (nomePrato, quantia, url_avatar)
  VALUES ('Pato no Tucupi', '2 Pratos', 'https://t2.rg.ltmcdn.com/pt/images/4/1/9/img_pato_no_tucupi_paraense_2914_orig.jpg');
''';
