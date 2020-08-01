package com.islery.whooooo.ui.list

import com.islery.whooooo.data.model.VoteEvent
import moxy.MvpView
import moxy.viewstate.strategy.alias.AddToEndSingle

//interface with methods that can be called from presenter
interface VoteListView : MvpView {
    @AddToEndSingle
    fun setData(list: List<VoteEvent>)
    @AddToEndSingle
    fun showNextView(vote: VoteEvent)
    @AddToEndSingle
    fun showError()
    @AddToEndSingle
    fun showProgress()
    @AddToEndSingle
    fun hideProgress()
}