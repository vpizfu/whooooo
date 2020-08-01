package com.islery.whooooo.data.login

import com.islery.whooooo.data.register.AuthResult

interface ILoginRepo {
    fun peformLogin(email: String, pass: String, onResult: (result: AuthResult<String?>) -> Unit)
}