package unknown.error.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import unknown.error.domain.KeywordVO;
import unknown.error.persistence.KeywordDAO;
@Controller
public class HomeController {
	@Inject
	KeywordDAO dao;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		model.addAttribute("list",dao.selectAll());
		return "home";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String keyword(@RequestParam String keyword, Model model) throws Exception {
		//HashMap<String, String> key = new HashMap<String, String>();

		String key = URLEncoder.encode("\"keyword\"","UTF-8");
		String value = URLEncoder.encode("\""+keyword+"\"","UTF-8");
		String url ="http://127.0.0.1:5009/keyword?kw={"+key+":"+value+"}";
		JSONObject json = readJsonFromUrl(url);
		String result=(String) json.get("result");
		dao.addKeyword(keyword);
		
		model.addAttribute("list",dao.selectAll());
		
		return "redirect:/";
	}
	private static String readAll(Reader rd) throws IOException {
	    StringBuilder sb = new StringBuilder();
	    int cp;
	    while ((cp = rd.read()) != -1) {
	      sb.append((char) cp);
	    }
	    return sb.toString();
	  }
	
	public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
	    InputStream is = new URL(url).openStream();
	    		try {
	      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
	      String jsonText = readAll(rd);
	      JSONObject json = new JSONObject(jsonText);
	      return json;
	    } finally {
	      is.close();
	    }
	  }
	@RequestMapping(value = "/req", method = RequestMethod.POST)
	public void req(@RequestParam HashMap params,HttpServletRequest request) throws Exception {
		Iterator iterator = params.keySet().iterator();
		String keyword = null;
		while (iterator.hasNext()) {
			keyword = (String)iterator.next();
		}
		KeywordVO vo = new KeywordVO();
		vo.setKeyword(keyword);
		vo.setFlag(1);
		dao.updateFlag(vo);
	}
	/*
	@RequestMapping(value="/sessionchk",method=RequestMethod.POST)
	public @ResponseBody String sessioncheck() throws UnsupportedEncodingException {
		
		if(kkk!=null) {
			String keyword=URLEncoder.encode(kkk,"UTF-8");
			kkk=null;
			System.out.println(keyword+"들어갑니다용");
			return keyword;
		}
		else {
			System.out.println("널값임");
			return null;
		}
	}
	*/
}
