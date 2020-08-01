package com.islery.whooooo.ui.register

import com.islery.whooooo.data.register.AuthResult
import com.islery.whooooo.data.register.IRegRepo
import com.islery.whooooo.data.register.RegisterRepositoryImpl
import moxy.MvpPresenter

class RegisterPresenter : MvpPresenter<ReqisterView>() {
    private val repository: IRegRepo = RegisterRepositoryImpl()


    fun performRegistration(email: String, pass: String, name: String) {
        val validMail = validateEmail(email)
        val validPass = validatePassword(pass)
        val validName = validateUsername(name)
        if (validMail && validPass && validName) {
            repository.performRegistration(email, pass, name) { onRegistrationResult(it) }
        }
    }

    private fun validatePassword(pass: String): Boolean {
        return when {
            pass.isEmpty() -> {
                viewState.onPassError("Password can't be empty")
                false
            }
            pass.length < 6 -> {
                viewState.onPassError("Password length should be 6 or more characters")
                false
            }
            else -> {
                viewState.onPassError(null)
                true
            }
        }
    }

    private fun validateEmail(email: String): Boolean {
        return when {
            email.isEmpty() -> {
                viewState.onEmailError("Email can't be empty")
                false
            }
            else -> {
                viewState.onEmailError(null)
                true
            }
        }
    }

    private fun validateUsername(name: String): Boolean {
        return when {
            name.isEmpty() -> {
                viewState.onEmailError("Name can't be empty")
                false
            }
            else -> {
                viewState.onEmailError(null)
                true
            }
        }
    }

    private fun onRegistrationResult(res: AuthResult<String?>) {
        when (res) {
            is AuthResult.Error -> {
                val message: String = res.msg ?: "Something went wrong"
                viewState.onRegisterError(message)
            }
            is AuthResult.Success -> viewState.onRegisterSuccess()
        }
    }
}

