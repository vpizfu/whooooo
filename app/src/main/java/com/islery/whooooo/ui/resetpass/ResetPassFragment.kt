package com.islery.whooooo.ui.resetpass

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.navigation.fragment.findNavController
import com.google.android.material.snackbar.Snackbar
import com.islery.whooooo.R
import com.islery.whooooo.databinding.FragmentResetPassBinding
import moxy.MvpAppCompatFragment
import moxy.ktx.moxyPresenter


class ResetPassFragment : MvpAppCompatFragment(), ResetPassView {

    private var _binding: FragmentResetPassBinding? = null
    private val binding get() = _binding!!

    private val presenter by moxyPresenter { ResetPassPresenter() }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentResetPassBinding.inflate(inflater, container, false)
        binding.resetBtn.setOnClickListener {
            presenter.resetPassword(
                binding.inputEmail.text.toString().trim()
            )
        }
        return binding.root
    }


    override fun onResetSuccess() {
        Snackbar.make(binding.root, "Please check your email", Snackbar.LENGTH_LONG).show()
        findNavController().popBackStack()
    }

    override fun onResetError(error: String) {
        Toast.makeText(requireContext(), error, Toast.LENGTH_SHORT).show()
    }

    override fun onEmailError(error: String?) {
        binding.inputEmailLayout.error = error
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}