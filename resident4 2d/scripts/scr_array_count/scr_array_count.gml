function array_count(_array, _valor) {
    var _contador = 0;
    var _tamanho = array_length(_array);
    
    for (var i = 0; i < _tamanho; i++) {
        if (_array[i] == _valor) {
            _contador++;
        }
    }
    
    return _contador;
}