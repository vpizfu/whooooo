package com.islery.whooooo.data.resetpass

import com.islery.whooooo.data.register.AuthResult

interface IResetRepo {
    fun resetPassword(email: String, onResult: (result: AuthResult<String?>) -> Unit)
}