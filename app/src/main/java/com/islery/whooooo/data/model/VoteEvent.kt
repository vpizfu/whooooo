package com.islery.whooooo.data.model

import android.os.Parcelable
import android.text.BoringLayout
import kotlinx.android.parcel.Parcelize

@Parcelize
data class VoteEvent(
    val id: String,
    val name: String,
    val one: String,
    val two: String,
    val active: Boolean
) : Parcelable