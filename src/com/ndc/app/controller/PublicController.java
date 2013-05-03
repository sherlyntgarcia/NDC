package com.ndc.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ndc.app.model.Document;
import com.ndc.app.model.SpgCategory;
import com.ndc.app.model.SpgSubCategory;
import com.ndc.app.response.Response;
import com.ndc.app.service.SpgService;
import com.ndc.app.service.UserService;
import com.ndc.app.util.MailUtil;
import com.ndc.app.util.PropertiesUtil;

@Controller
@RequestMapping(value="/external")
public class PublicController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("spgService")
	private SpgService spgService;
	
	@Autowired
	private MailUtil mailUtil; 
	
	@RequestMapping
	public String externalDashboard(Model model) {
		return "external/externalDashboard";
	}
	
	@RequestMapping(value="/luzon")
	public String externalAMGLuzon(Model model) {
		return "external/luzon_map";
	}
	
	@RequestMapping(value="/visayas")
	public String externalAMGVisayas(Model model) {
		return "external/visayas_map";
	}
	
	@RequestMapping(value="/mindanao")
	public String externalAMGMindanao(Model model) {
		return "external/mindanao_map";
	}
	
	@RequestMapping(value="/fundManagement")
	public String externalFundManagement(Model model) {
		return "external/externalDashboardFundManagement";
	}
	
	@RequestMapping(value="/asean_bintulu")
	public String aseanBintulu(Model model) {
		return "external/asean_bintulu";
	}
	
	@RequestMapping(value="/asean_aceh")
	public String aseanAceh(Model model) {
		return "external/asean_aceh";
	}
	
	@RequestMapping(value="/asean_potashMining")
	public String aseanPotash(Model model) {
		return "external/asean_potashMining";
	}
	
	@RequestMapping(value="/mining_miningDevelopment")
	public String miningDevelopment(Model model) {
		return "external/mining_miningDevelopment";
	}
	
	@RequestMapping(value="/mining_semiraraMining")
	public String semiraraMining(Model model) {
		return "external/mining_semiraraMining";
	}
	
	@RequestMapping(value="/energy_bioEnergy")
	public String bioEnergy(Model model) {
		return "external/energy_bioEnergy";
	}
	
	@RequestMapping(value="/industrial_refractories")
	public String refractories(Model model) {
		return "external/industrial_refractories";
	}
	
	@RequestMapping(value="/realEstate_manilaExposition")
	public String manilaExposition(Model model) {
		return "external/realEstate_manilaExposition";
	}
	
	@RequestMapping(value="/realEstate_sciencePark")
	public String sciencePark(Model model) {
		return "external/realEstate_sciencePark";
	}
	
	@RequestMapping(value="/realEstate_pinagkaisa")
	public String pinagkaisa(Model model) {
		return "external/realEstate_pinagkaisa";
	}
	
	@RequestMapping(value="/realEstate_kamayanRealty")
	public String kamayanRealty(Model model) {
		return "external/realEstate_kamayanRealty";
	}
	
	@RequestMapping(value="/realEstate_batangasLand")
	public String batangasLand(Model model) {
		return "external/realEstate_batangasLand";
	}
	
	@RequestMapping(value="/realEstate_gyRealEstate")
	public String gyRealEstate(Model model) {
		return "external/realEstate_gyRealEstate";
	}
	
	@RequestMapping(value="/others_PITC")
	public String PITC(Model model) {
		return "external/others_PITC";
	}
	
	@RequestMapping(value="/others_lideMngt")
	public String lideMngt(Model model) {
		return "external/others_lideMngt";
	}
	
	@RequestMapping(value="/project_ndcSchool")
	public String ndcSchool(Model model) {
		return "external/project_ndcSchool";
	}
	
	@RequestMapping(value="/project_FCIE")
	public String FCIE(Model model) {
		return "external/project_FCIE";
	}
	
	@RequestMapping(value="/project_foodExchange")
	public String foodExchange(Model model) {
		return "external/project_foodExchange";
	}
	
	@RequestMapping(value="/project_mini-hydro")
	public String miniHydro(Model model) {
		return "external/project_mini-hydro";
	}
	
	@RequestMapping(value="/project_redondo")
	public String redondo(Model model) {
		return "external/project_redondo";
	}
	
	@RequestMapping(value="/project_biomass")
	public String biomass(Model model) {
		return "external/project_bioMass";
	}
	
	@RequestMapping(value="/project_rubberProcessing")
	public String rubberProcessing(Model model) {
		return "external/project_rubberProcessing";
	}
	
	@RequestMapping(value="/submit")
	public String submitFeedback(HttpServletRequest request, RedirectAttributes attr) {
		
		try {
			mailUtil.sendCustomerFeedback(request);
			attr.addFlashAttribute("success", PropertiesUtil.getProperty("success.customer.feedback"));
		} catch(Exception e) {
			e.printStackTrace();
			attr.addFlashAttribute("error", PropertiesUtil.getProperty("error.customer.feedback"));
		}
		
		return "redirect:/external";
		
	}
	
	@RequestMapping(value="/disclosures")
	public String displayDisclosures(Model model) {
		
		List<Document> documents = userService.getAllDocuments();
		model.addAttribute("documents", documents);
		
		model.addAttribute("aseanDir", PropertiesUtil.getProperty("upload.dir.asean"));
		model.addAttribute("miningDir", PropertiesUtil.getProperty("upload.dir.mining"));
		model.addAttribute("energyDir", PropertiesUtil.getProperty("upload.dir.energy"));
		model.addAttribute("industrialDir", PropertiesUtil.getProperty("upload.dir.industrial"));
		model.addAttribute("realEstateDir", PropertiesUtil.getProperty("upload.dir.realestate"));
		model.addAttribute("othersDir", PropertiesUtil.getProperty("upload.dir.others"));
		
		return "external/externalDisclosures";
		
	}
	
	@RequestMapping(value="/existing/{id}", method=RequestMethod.GET)
	public String displaySpgProject(@PathVariable(value="id") Long id, Model model) {
		
		try {
			if(id != null) {
				SpgSubCategory spgSubCategory = spgService.getSubCategoryById(id);
				
				if(spgSubCategory == null)
					return "error/exceptionView";
				
				model.addAttribute("spgSubCategory", spgSubCategory);
			}
		} catch(Exception e) {
			return "error/exceptionView";
		}
		
		return "external/externalExistingTemplate";
		
	}
	
	@ModelAttribute("title")
	public String getTitle() {
		return PropertiesUtil.getProperty("app.title");
	}
	
	@ModelAttribute("spgCategories")
	public List<SpgCategory> getCategories() {
		return spgService.getCategories();
	}

}
