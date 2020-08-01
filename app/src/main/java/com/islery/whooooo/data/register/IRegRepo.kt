package com.islery.whooooo.data.register

interface IRegRepo {
    fun performRegistration(email: String, pass: String, username: String,onResult: (result:AuthResult<String?>) -> Unit)
}

sealed class AuthResult<out A> {
    object Success : AuthResult<Nothing>()
    data class Error<out A>(val msg: A) : AuthResult<A>()
}