package com.islery.whooooo.ui.login

import com.islery.whooooo.data.login.ILoginRepo
import com.islery.whooooo.data.login.LoginRepositoryImpl
import com.islery.whooooo.data.register.AuthResult
import moxy.MvpPresenter

class LoginPresenter : MvpPresenter<LoginView>(){

    private val repo: ILoginRepo = LoginRepositoryImpl()

    fun performLogin(email: String, pass: String){
        val validMail = validateEmail(email)
        val validPass = validatePassword(pass)
        if (validMail&&validPass){
            repo.peformLogin(email,pass){onLoginResult(it)}
        }
    }

    fun toRegistration(){
        viewState.proceedToRegistration()
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

    private fun onLoginResult(res: AuthResult<String?>) {
        when (res) {
            is AuthResult.Error -> {
                val message: String = res.msg ?: "Something went wrong"
                viewState.onLoginError(message)
            }
            is AuthResult.Success -> viewState.onLoginSuccess()
        }
    }
}