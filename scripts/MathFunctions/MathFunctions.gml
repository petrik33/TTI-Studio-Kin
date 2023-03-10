function signum(_x) {
	var _sign = sign(x);
	return (_sign != 0) ? _sign : 1;
}

function approximately_equal(_a, _b, _approximation = VECTOR_APPROXIMATION) {
	return abs(_a - _b) <= _approximation;	
}