package com.islery.whooooo.ui.list

import com.islery.whooooo.data.model.VoteEvent
import moxy.MvpView
import moxy.viewstate.strategy.alias.AddToEndSingle
import moxy.viewstate.strategy.alias.Skip

//interface with methods that can be called from presenter
interface VoteListView : MvpView {
    @AddToEndSingle
    fun setData(list: List<VoteEvent>)
    @Skip
    fun showNextView(vote: VoteEvent)
    @AddToEndSingle
    fun showError()
    @AddToEndSingle
    fun showProgress()
    @AddToEndSingle
    fun hideProgress()
}