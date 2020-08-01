package com.islery.whooooo.ui.register

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.google.firebase.auth.FirebaseAuth
import com.islery.whooooo.databinding.FragmentRegisterBinding
import moxy.MvpAppCompatFragment
import moxy.ktx.moxyPresenter


class RegisterFragment : MvpAppCompatFragment(), ReqisterView {

    private var _binding: FragmentRegisterBinding? = null
    private val binding get() = _binding!!

    private val presenter by moxyPresenter { RegisterPresenter() }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentRegisterBinding.inflate(inflater, container, false)
        binding.regBtn.setOnClickListener {
            presenter.performRegistration(
                binding.inputEmail.text.toString().trim(),
                binding.inputPass.text.toString().trim(),
                binding.inputUsername.text.toString().trim()
            )
        }
        val user = FirebaseAuth.getInstance().currentUser
        Log.d("My_TAG", "onCreateView: ${user?.displayName}")
        return binding.root
    }

    override fun onRegisterSuccess() {
        Toast.makeText(requireContext(), "success", Toast.LENGTH_SHORT).show()
    }

    override fun onRegisterError(error: String) {
        Toast.makeText(requireContext(), "error", Toast.LENGTH_SHORT).show()
    }

    override fun onEmailError(error: String?) {
        binding.inputEmailLayout.error = error
    }

    override fun onPassError(error: String?) {
        binding.inputPassLayout.error = error
    }

    override fun onDestroy() {
        super.onDestroy()
        _binding = null
    }
}