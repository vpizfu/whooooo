package com.islery.whooooo.ui.list

import android.util.Log
import com.google.firebase.database.ktx.database
import com.google.firebase.ktx.Firebase
import com.islery.whooooo.data.model.VoteEvent
import moxy.MvpPresenter

class VoteListPresenter : MvpPresenter<VoteListView>() {

    fun getData(){
        viewState.setData(listOf(VoteEvent("Fake Event", "https://memepedia.ru/wp-content/uploads/2019/06/odna-zhenschina-plachet-drugaya-obnimaet.jpg","https://memepedia.ru/wp-content/uploads/2019/06/ozadachennyy-kot-sidit-za-stolom-6.jpg")))
    }

    fun showVoteDetails(event: VoteEvent){
        viewState.showNextView(event)
    }
}