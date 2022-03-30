package liga.medical.personservice.core.config.handler;

import liga.medical.personservice.core.model.PersonDataEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

@Component
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

        if (roles.contains("ROLE_ADMIN")) {
            response.sendRedirect("/person/data");
        } else if (roles.contains("ROLE_USER")) {
            Long id = ((PersonDataEntity) authentication.getPrincipal()).getId();
            response.sendRedirect("/person/data/" + id);
        }
        super.onAuthenticationSuccess(request, response, authentication);
    }
}
