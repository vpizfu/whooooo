package com.islery.whooooo.data.model

import android.os.Parcelable
import android.text.BoringLayout
import kotlinx.android.parcel.Parcelize

@Parcelize
data class VoteEvent(
    val identifier: String = "",
    val name: String = "",
    val firstItem: String = "",
    val secondItem: String = "",
    val active: Boolean = false,
    val dateFrom: Long = 0,
    val dateTo: Long = 0
) : Parcelable