package com.islery.whooooo.ui.login

import moxy.MvpView
import moxy.viewstate.strategy.alias.AddToEndSingle
import moxy.viewstate.strategy.alias.SingleState
import moxy.viewstate.strategy.alias.Skip

interface LoginView : MvpView{
    @Skip
    fun onLoginSuccess()

    @Skip
    fun proceedToRegistration()

    @SingleState
    fun onLoginError(error: String)

    @AddToEndSingle
    fun onEmailError(error: String?)

    @AddToEndSingle
    fun onPassError(error: String?)

    @Skip
    fun proceedToRecovery()
}