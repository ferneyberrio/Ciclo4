class Usuar {
  var _uid;
  var _name;
  var _email;
  var _password;
  var _genre;
  var _favoritesGenres;
  var _bornDate;
  var _logo;
  var _descCorta;
  var _descLarga;
  var _latitud;
  var _longitud;
  var _direccion;

  Usuar(
      this._uid,
      this._name,
      this._email,
      this._password,
      this._genre,
      this._favoritesGenres,
      this._bornDate,
      this._logo,
      this._descCorta,
      this._descLarga,
      this._latitud,
      this._longitud,
      this._direccion);


  Usuar.Empty();

  Usuar.fromJson(Map<String, dynamic> json)
      : _uid = json['uid'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _favoritesGenres = json['favoritesGenres'],
        _bornDate = json['bornDate'],
        _logo = json['logo'],
        _descCorta = json['descCorta'],
        _descLarga = json['descLarga'],
        _latitud = json['latitud'],
        _longitud = json['longitud'],
        _direccion = json['direccion'];

  Map<String, dynamic> toJson() => {
        'uid': _uid,
        'name': _name,
        'email': _email,
        'password': _password,
        'genre': _genre,
        'favoritesGenres': _favoritesGenres,
        'bornDate': _bornDate,
        'logo': _logo,
        'descCorta': _descCorta,
        'descLarga': _descLarga,
        'latitud': _latitud,
        'longitud': _longitud,
        'direccion': _direccion
      };

  get logo => _logo;

  get direccion => _direccion;

  set direccion(value) {
    _direccion = value;
  }

  set logo(value) {
    _logo = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  get name => _name;

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  set name(value) {
    _name = value;
  }

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get favoritesGenres => _favoritesGenres;

  set favoritesGenres(value) {
    _favoritesGenres = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }

  get descCorta => _descCorta;

  set descCorta(value) {
    _descCorta = value;
  }

  get descLarga => _descLarga;

  set descLarga(value) {
    _descLarga = value;
  }

  get longitud => _longitud;

  set longitud(value) {
    _longitud = value;
  }
}
