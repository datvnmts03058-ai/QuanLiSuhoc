<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Sử Môn - Khai Mở Lịch Sử Việt Nam</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;0,700;1,400;1,600&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

<style>

/* ===================================================
   RESET & BASE
=================================================== */
*, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

:root {
    --color-primary:   #0F172A;
    --color-gold:      #D4A017;
    --color-gold-light:#F0C84A;
    --color-light:     #F8F5EE;
    --color-accent:    #B91C1C;
    --color-bg:        #F8FAFC;
    --color-surface:   #FFFFFF;
    --color-muted:     #64748B;
    --color-border:    #E2E8F0;
    --font-display:    'Cormorant Garamond', Georgia, serif;
    --font-body:       'Inter', system-ui, sans-serif;
    --radius-card:     16px;
    --radius-pill:     999px;
    --shadow-card:     0 4px 24px rgba(15,23,42,0.08);
    --shadow-hover:    0 16px 48px rgba(15,23,42,0.18);
    --transition-base: 0.35s cubic-bezier(0.4, 0, 0.2, 1);
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: var(--font-body);
    color: var(--color-primary);
    line-height: 1.6;
    overflow-x: hidden;

    background:
        linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
        url('${pageContext.request.contextPath}/assets/images/backgrounds/hero-bg.png');

    background-size: cover;
    background-position: center;
    background-attachment: fixed; /* quan trọng */
}

/* ===================================================
   HERO SECTION
=================================================== */
.su-hero {
    position: relative;
    width: 100%;
    min-height: 90vh;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
  
}

.su-hero__bg {
    position: absolute;
    inset: 0;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

.su-hero:hover .su-hero__bg {
    transform: scale(1.0);
}



.su-hero__decor-line {
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 1px;
    height: 80px;
    background: linear-gradient(to bottom, transparent, var(--color-gold));
    opacity: 0.6;
}

.su-hero__content {
    position: relative;
    z-index: 2;
    text-align: center;
    padding: 2rem 1.5rem;
    max-width: 860px;
    width: 100%;
    animation: heroFadeUp 1.1s cubic-bezier(0.4, 0, 0.2, 1) both;
}

@keyframes heroFadeUp {
    from { opacity: 0; transform: translateY(40px); }
    to   { opacity: 1; transform: translateY(0); }
}

.su-hero__logo {
    width: 80px;
    height: 80px;
    object-fit: contain;
    margin-bottom: 1.5rem;
    filter: drop-shadow(0 2px 16px rgba(212,160,23,0.4));
    animation: heroFadeUp 1.1s 0.1s cubic-bezier(0.4, 0, 0.2, 1) both;
}

.su-hero__eyebrow {
    display: inline-block;
    font-family: var(--font-body);
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.25em;
    text-transform: uppercase;
    color: var(--color-gold);
    background: rgba(212,160,23,0.12);
    border: 1px solid rgba(212,160,23,0.3);
    padding: 0.35rem 1rem;
    border-radius: var(--radius-pill);
    margin-bottom: 1.5rem;
    animation: heroFadeUp 1.1s 0.2s cubic-bezier(0.4, 0, 0.2, 1) both;
}

.su-hero__title {
    font-family: var(--font-display);
    font-size: clamp(4rem, 10vw, 8rem);
    font-weight: 700;
    line-height: 1.0;
    color: #FFFFFF;
    letter-spacing: -0.02em;
    margin-bottom: 0.5rem;
    animation: heroFadeUp 1.1s 0.25s cubic-bezier(0.4, 0, 0.2, 1) both;
}

.su-hero__title span {
    color: var(--color-gold);
    display: inline-block;
}

.su-hero__subtitle {
    font-family: var(--font-display);
    font-size: clamp(1.25rem, 3vw, 1.75rem);
    font-weight: 400;
    font-style: italic;
    color: rgba(255,255,255,0.75);
    margin-bottom: 1.25rem;
    animation: heroFadeUp 1.1s 0.35s cubic-bezier(0.4, 0, 0.2, 1) both;
}

.su-hero__desc {
    font-size: 1rem;
    color: #FFFFFF;
    max-width: 520px;
    margin: 0 auto 2.5rem;
    line-height: 1.75;
    animation: heroFadeUp 1.1s 0.45s cubic-bezier(0.4, 0, 0.2, 1) both;
}

.su-hero__actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
    animation: heroFadeUp 1.1s 0.55s cubic-bezier(0.4, 0, 0.2, 1) both;
}

.btn-gold {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: var(--color-gold);
    color: var(--color-primary);
    font-family: var(--font-body);
    font-weight: 600;
    font-size: 0.9rem;
    letter-spacing: 0.04em;
    padding: 0.85rem 2rem;
    border-radius: var(--radius-pill);
    border: 2px solid var(--color-gold);
    text-decoration: none;
    transition: var(--transition-base);
    white-space: nowrap;
}

.btn-gold:hover {
    background: var(--color-gold-light);
    border-color: var(--color-gold-light);
    color: var(--color-primary);
    transform: translateY(-2px);
    box-shadow: 0 8px 32px rgba(212,160,23,0.4);
}

.btn-ghost {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: transparent;
    color: rgba(255,255,255,0.85);
    font-family: var(--font-body);
    font-weight: 500;
    font-size: 0.9rem;
    letter-spacing: 0.04em;
    padding: 0.85rem 2rem;
    border-radius: var(--radius-pill);
    border: 2px solid rgba(255,255,255,0.3);
    text-decoration: none;
    transition: var(--transition-base);
    white-space: nowrap;
}

.btn-ghost:hover {
    background: rgba(255,255,255,0.1);
    border-color: rgba(255,255,255,0.6);
    color: #FFFFFF;
    transform: translateY(-2px);
}

/* ===================================================
   STATS FLOATING CARDS
=================================================== */
.su-stats {
    position: relative;
    z-index: 10;
    margin-top: -4rem;
    padding: 0 1.5rem 4rem;
}

.su-stats__grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 1rem;
    max-width: 1000px;
    margin: 0 auto;
}

.su-stat-card {
    background: var(--color-surface);
    border-radius: var(--radius-card);
    padding: 1.75rem 1.25rem;
    text-align: center;
    box-shadow: var(--shadow-card);
    border: 1px solid var(--color-border);
    transition: var(--transition-base);
    position: relative;
    overflow: hidden;
}

.su-stat-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--color-gold), var(--color-gold-light));
    transform: scaleX(0);
    transition: transform 0.4s ease;
    transform-origin: left;
}

.su-stat-card:hover {
    transform: translateY(-6px);
    box-shadow: var(--shadow-hover);
}

.su-stat-card:hover::before {
    transform: scaleX(1);
}

.su-stat-number {
    font-family: var(--font-display);
    font-size: 2.5rem;
    font-weight: 700;
    color: var(--color-primary);
    line-height: 1.1;
    margin-bottom: 0.35rem;
}

.su-stat-number em {
    font-style: normal;
    color: var(--color-gold);
}

.su-stat-label {
    font-size: 0.8rem;
    font-weight: 500;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--color-muted);
}

/* ===================================================
   SECTION INTRO
=================================================== */
.su-intro {
    padding: 100px 1.5rem;
    text-align: center;
}

.su-section-eyebrow {
    display: inline-block;
    font-size: 0.7rem;
    font-weight: 600;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--color-gold);
    margin-bottom: 1rem;
}

.su-section-title {
    font-family: var(--font-display);
    font-size: clamp(2rem, 4vw, 3rem);
    font-weight: 700;
    color: rgba(255, 255, 255, 0.85);
    line-height: 1.2;
    margin-bottom: 1.25rem;
}

.su-section-desc {
    font-size: 1.05rem;
    color: rgba(255, 255, 255, 0.85);
    max-width: 560px;
    margin: 0 auto;
    line-height: 1.8;
    text-shadow: 0 2px 8px rgba(0,0,0,0.6);
}

.su-divider {
    width: 60px;
    height: 3px;
    background: linear-gradient(90deg, var(--color-gold), var(--color-gold-light));
    border-radius: 3px;
    margin: 1.5rem auto 0;
}

/* ===================================================
   FEATURE GRID
=================================================== */
.su-features {
    padding: 0 1.5rem 100px;
    background: var(--color-bg);
}

.su-features__inner {
    max-width: 1200px;
    margin: 0 auto;
}

.su-features__header {
    text-align: center;
    margin-bottom: 3.5rem;
}

.su-feature-cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
}

.su-feature-card {
    display: flex;
    flex-direction: column;
    background: var(--color-surface);
    border: 1px solid var(--color-border);
    border-radius: var(--radius-card);
    padding: 2.5rem 2rem;
    text-decoration: none;
    color: inherit;
    transition: var(--transition-base);
    position: relative;
    overflow: hidden;
    box-shadow: var(--shadow-card);
}

.su-feature-card::after {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(212,160,23,0.04) 0%, transparent 60%);
    opacity: 0;
    transition: opacity 0.4s ease;
}

.su-feature-card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow-hover);
    border-color: rgba(212,160,23,0.3);
    color: inherit;
}

.su-feature-card:hover::after {
    opacity: 1;
}

.su-feature-card__icon-wrap {
    width: 68px;
    height: 68px;
    background: linear-gradient(135deg, rgba(212,160,23,0.12), rgba(212,160,23,0.04));
    border: 1px solid rgba(212,160,23,0.2);
    border-radius: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.9rem;
    margin-bottom: 1.5rem;
    transition: var(--transition-base);
}

.su-feature-card:hover .su-feature-card__icon-wrap {
    background: linear-gradient(135deg, rgba(212,160,23,0.2), rgba(212,160,23,0.08));
    transform: scale(1.08) rotate(-3deg);
}

.su-feature-card__title {
    font-family: var(--font-display);
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--color-primary);
    margin-bottom: 0.75rem;
    line-height: 1.2;
}

.su-feature-card__desc {
    font-size: 0.9rem;
    color: var(--color-muted);
    line-height: 1.7;
    flex: 1;
}

.su-feature-card__arrow {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    font-size: 0.8rem;
    font-weight: 600;
    color: var(--color-gold);
    margin-top: 1.5rem;
    letter-spacing: 0.05em;
    transition: gap 0.25s ease;
}

.su-feature-card:hover .su-feature-card__arrow {
    gap: 0.75rem;
}

/* ===================================================
   CHARACTER SECTION
=================================================== */
.su-characters {
    padding: 100px 1.5rem;
    background: var(--color-primary);
    position: relative;
    overflow: hidden;
}

.su-characters::before {
    content: '';
    position: absolute;
    top: -120px;
    left: -120px;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(212,160,23,0.08) 0%, transparent 70%);
    pointer-events: none;
}

.su-characters::after {
    content: '';
    position: absolute;
    bottom: -80px;
    right: -80px;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(185,28,28,0.07) 0%, transparent 70%);
    pointer-events: none;
}

.su-characters__inner {
    max-width: 1200px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
}

.su-characters__header {
    text-align: center;
    margin-bottom: 3.5rem;
}

.su-characters__header .su-section-eyebrow {
    color: var(--color-gold);
}

.su-characters__header .su-section-title {
    color: #FFFFFF;
}

.su-characters__header .su-section-desc {
    color: rgba(255,255,255,0.5);
}

.su-character-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1.5rem;
}

.su-character-card {
    position: relative;
    border-radius: var(--radius-card);
    overflow: hidden;
    background: #1E293B;
    box-shadow: 0 4px 24px rgba(0,0,0,0.4);
    transition: var(--transition-base);
    cursor: pointer;
}

.su-character-card:hover {
    transform: translateY(-10px) scale(1.01);
    box-shadow: 0 24px 64px rgba(0,0,0,0.6);
}

.su-character-card__img-wrap {
    position: relative;
    aspect-ratio: 3/4;
    overflow: hidden;
}

.su-character-card__img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: top center;
    transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1);
    display: block;
}

.su-character-card:hover .su-character-card__img {
    transform: scale(1.08);
}

.su-character-card__gradient {
    position: absolute;
    inset: 0;
    background: linear-gradient(
        to top,
        rgba(15, 23, 42, 0.98) 0%,
        rgba(15, 23, 42, 0.6) 45%,
        rgba(15, 23, 42, 0.1) 75%,
        transparent 100%
    );
    transition: var(--transition-base);
}

.su-character-card:hover .su-character-card__gradient {
    background: linear-gradient(
        to top,
        rgba(15, 23, 42, 1) 0%,
        rgba(15, 23, 42, 0.7) 50%,
        rgba(15, 23, 42, 0.2) 80%,
        transparent 100%
    );
}

.su-character-card__body {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 1.75rem 1.5rem;
    transform: translateY(0);
    transition: var(--transition-base);
}

.su-character-card__dynasty {
    display: inline-block;
    font-size: 0.68rem;
    font-weight: 600;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: var(--color-gold);
    background: rgba(212,160,23,0.15);
    border: 1px solid rgba(212,160,23,0.3);
    border-radius: var(--radius-pill);
    padding: 0.3rem 0.85rem;
    margin-bottom: 0.75rem;
}

.su-character-card__name {
    font-family: var(--font-display);
    font-size: 1.5rem;
    font-weight: 700;
    color: #FFFFFF;
    line-height: 1.2;
    margin-bottom: 0.6rem;
}

.su-character-card__desc {
    font-size: 0.85rem;
    color: rgba(255,255,255,0.6);
    line-height: 1.65;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    margin-bottom: 1.25rem;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.4s ease, opacity 0.4s ease;
    opacity: 0;
}

.su-character-card:hover .su-character-card__desc {
    max-height: 3.3rem;
    opacity: 1;
}

.su-character-card__cta {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    font-size: 0.8rem;
    font-weight: 600;
    color: var(--color-gold);
    text-decoration: none;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    border-bottom: 1px solid rgba(212,160,23,0.3);
    padding-bottom: 0.1rem;
    transition: var(--transition-base);
    opacity: 0;
    transform: translateY(8px);
    transition: opacity 0.35s ease 0.05s, transform 0.35s ease 0.05s, color 0.2s ease;
}

.su-character-card:hover .su-character-card__cta {
    opacity: 1;
    transform: translateY(0);
}

.su-character-card__cta:hover {
    color: var(--color-gold-light);
    gap: 0.7rem;
}

.su-characters__more {
    text-align: center;
    margin-top: 3rem;
}

.btn-outline-gold {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: transparent;
    color: var(--color-gold);
    font-family: var(--font-body);
    font-weight: 600;
    font-size: 0.9rem;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    padding: 0.85rem 2.5rem;
    border-radius: var(--radius-pill);
    border: 1.5px solid rgba(212,160,23,0.4);
    text-decoration: none;
    transition: var(--transition-base);
}

.btn-outline-gold:hover {
    background: rgba(212,160,23,0.08);
    border-color: var(--color-gold);
    color: var(--color-gold-light);
    transform: translateY(-2px);
}

/* ===================================================
   FOOTER
=================================================== */
.su-footer {
    background: #080D18;
    color: rgba(255,255,255,0.6);
    padding: 64px 1.5rem 32px;
    border-top: 1px solid rgba(255,255,255,0.06);
}

.su-footer__inner {
    max-width: 1200px;
    margin: 0 auto;
}

.su-footer__grid {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr;
    gap: 3rem;
    padding-bottom: 3rem;
    border-bottom: 1px solid rgba(255,255,255,0.08);
    margin-bottom: 2rem;
}

.su-footer__brand-logo {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    text-decoration: none;
    margin-bottom: 1rem;
}

.su-footer__brand-logo img {
    width: 36px;
    height: 36px;
    object-fit: contain;
    filter: brightness(1.2);
}

.su-footer__brand-name {
    font-family: var(--font-display);
    font-size: 1.5rem;
    font-weight: 700;
    color: #FFFFFF;
    letter-spacing: 0.02em;
}

.su-footer__brand-desc {
    font-size: 0.875rem;
    line-height: 1.75;
    color: rgba(255,255,255,0.45);
    max-width: 300px;
}

.su-footer__col-title {
    font-size: 0.7rem;
    font-weight: 600;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--color-gold);
    margin-bottom: 1.25rem;
}

.su-footer__links {
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
}

.su-footer__links a {
    font-size: 0.875rem;
    color: rgba(255,255,255,0.5);
    text-decoration: none;
    transition: color 0.25s ease;
}

.su-footer__links a:hover {
    color: var(--color-gold);
}

.su-footer__bottom {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 1rem;
}

.su-footer__copyright {
    font-size: 0.8rem;
    color: rgba(255,255,255,0.3);
}

.su-footer__badge {
    font-size: 0.75rem;
    color: rgba(255,255,255,0.25);
    letter-spacing: 0.1em;
    text-transform: uppercase;
}

/* ===================================================
   AI CHAT WIDGET
=================================================== */
.ai-button {
    position: fixed;
    bottom: 24px;
    right: 24px;
    background: var(--color-accent);
    color: white;
    border: none;
    padding: 14px 22px;
    border-radius: var(--radius-pill);
    cursor: pointer;
    font-weight: 600;
    font-size: 0.85rem;
    z-index: 999;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    box-shadow: 0 4px 20px rgba(185,28,28,0.4);
    transition: var(--transition-base);
    letter-spacing: 0.03em;
}

.ai-button:hover {
    background: #991B1B;
    transform: translateY(-2px);
    box-shadow: 0 8px 32px rgba(185,28,28,0.5);
}

.ai-chat-box {
    position: fixed;
    bottom: 88px;
    right: 24px;
    width: 340px;
    height: 440px;
    background: white;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.25);
    display: flex;
    flex-direction: column;
    overflow: hidden;
    z-index: 1000;
    border: 1px solid rgba(0,0,0,0.06);
}

.hidden { display: none; }

.ai-header {
    background: linear-gradient(135deg, var(--color-accent), #991B1B);
    color: white;
    padding: 14px 16px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: 600;
    font-size: 0.9rem;
}

.ai-header button {
    background: none;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 1.1rem;
    padding: 0;
    line-height: 1;
    opacity: 0.8;
}

.ai-messages {
    flex: 1;
    padding: 14px;
    overflow-y: auto;
    background: #F8FAFC;
}

.ai-msg {
    margin-bottom: 10px;
    padding: 10px 12px;
    border-radius: 12px;
    font-size: 0.875rem;
    line-height: 1.5;
}

.bot {
    background: #FFFFFF;
    color: var(--color-primary);
    border: 1px solid #E2E8F0;
    border-bottom-left-radius: 4px;
}

.user {
    background: var(--color-accent);
    color: white;
    text-align: right;
    border-bottom-right-radius: 4px;
}

.ai-input {
    display: flex;
    border-top: 1px solid #E2E8F0;
    background: white;
}

.ai-input input {
    flex: 1;
    padding: 12px 14px;
    border: none;
    outline: none;
    font-size: 0.875rem;
    font-family: var(--font-body);
}

.ai-input button {
    background: var(--color-accent);
    color: white;
    border: none;
    padding: 12px 18px;
    cursor: pointer;
    font-size: 0.875rem;
    font-weight: 600;
    transition: background 0.2s;
}

.ai-input button:hover {
    background: #991B1B;
}

/* ===================================================
   SCROLL REVEAL ANIMATION
=================================================== */
.reveal {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.7s ease, transform 0.7s ease;
}

.reveal.visible {
    opacity: 1;
    transform: translateY(0);
}

.reveal-delay-1 { transition-delay: 0.1s; }
.reveal-delay-2 { transition-delay: 0.2s; }
.reveal-delay-3 { transition-delay: 0.3s; }
.reveal-delay-4 { transition-delay: 0.4s; }
.reveal-delay-5 { transition-delay: 0.5s; }

/* ===================================================
   RESPONSIVE
=================================================== */
@media (max-width: 991px) {
    .su-stats__grid {
        grid-template-columns: repeat(2, 1fr);
    }

    .su-feature-cards {
        grid-template-columns: repeat(2, 1fr);
    }

    .su-feature-cards .su-feature-card:last-child {
        grid-column: span 2;
        max-width: 380px;
        margin: 0 auto;
        width: 100%;
    }

    .su-character-grid {
        grid-template-columns: repeat(2, 1fr);
    }

    .su-footer__grid {
        grid-template-columns: 1fr 1fr;
    }

    .su-footer__brand {
        grid-column: span 2;
    }
}

@media (max-width: 767px) {
    .su-hero__content {
        padding: 1.5rem 1rem;
    }

    .su-hero__actions {
        flex-direction: column;
        align-items: center;
    }

    .btn-gold,
    .btn-ghost {
        width: 100%;
        max-width: 300px;
        justify-content: center;
    }

    .su-stats {
        margin-top: -2rem;
    }

    .su-stats__grid {
        grid-template-columns: repeat(2, 1fr);
        gap: 0.75rem;
    }

    .su-stat-number {
        font-size: 2rem;
    }

    .su-feature-cards {
        grid-template-columns: 1fr;
    }

    .su-feature-cards .su-feature-card:last-child {
        grid-column: span 1;
        max-width: 100%;
    }

    .su-character-grid {
        grid-template-columns: 1fr;
    }

    .su-footer__grid {
        grid-template-columns: 1fr;
        gap: 2rem;
    }

    .su-footer__brand {
        grid-column: span 1;
    }

    .su-footer__bottom {
        flex-direction: column;
        text-align: center;
    }
}

@media (max-width: 480px) {
    .su-stats__grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

/* ===================================================
   REDUCED MOTION
=================================================== */
@media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
        animation-duration: 0.01ms !important;
        transition-duration: 0.01ms !important;
    }
}

</style>

</head>

<body>

<jsp:include page="/common/header.jsp"/>

<!-- ================= HERO ================= -->
<section class="su-hero">

    <div class="su-hero__bg"></div>
    <div class="su-hero__overlay"></div>
    <div class="su-hero__decor-line"></div>

    <div class="su-hero__content">


        <div class="su-hero__eyebrow">Nền Tảng Tri Thức Lịch Sử</div>

        <h1 class="su-hero__title">Sử <span>Môn</span></h1>

        <p class="su-hero__subtitle">Cánh Cổng Lịch Sử Việt Nam</p>

        <p class="su-hero__desc">
            Khám phá hơn 4000 năm lịch sử Việt Nam qua dữ liệu, nhân vật và triều đại — được trình bày trực quan, sinh động và chuyên sâu.
        </p>

        <div class="su-hero__actions">
            <a href="${pageContext.request.contextPath}/characters"
               class="btn-gold">
                &#9658;&nbsp; Khám Phá Ngay
            </a>
            <a href="#featured"
               class="btn-ghost">
                Nhân Vật Tiêu Biểu &darr;
            </a>
        </div>

    </div>
</section>

<!-- ================= STATS ================= -->
<div class="su-stats">
    <div class="su-stats__grid">

        <div class="su-stat-card reveal reveal-delay-1">
            <div class="su-stat-number"><em>4000</em>+</div>
            <div class="su-stat-label">Năm lịch sử</div>
        </div>

        <div class="su-stat-card reveal reveal-delay-2">
            <div class="su-stat-number"><em>1000</em>+</div>
            <div class="su-stat-label">Nhân vật</div>
        </div>

        <div class="su-stat-card reveal reveal-delay-3">
            <div class="su-stat-number"><em>500</em>+</div>
            <div class="su-stat-label">Sự kiện</div>
        </div>

        <div class="su-stat-card reveal reveal-delay-4">
            <div class="su-stat-number"><em>34</em></div>
            <div class="su-stat-label">Tỉnh thành</div>
        </div>

    </div>
</div>

<!-- ================= INTRO ================= -->
<section class="su-intro reveal">
    <div class="su-section-eyebrow">Về Sử Môn</div>
    <h2 class="su-section-title">Khám phá lịch sử Việt Nam</h2>
    <p class="su-section-desc">
        Sử Môn giúp bạn tiếp cận lịch sử Việt Nam theo cách trực quan, dễ hiểu và sinh động hơn — từ những nhân vật lỗi lạc đến các sự kiện định hình dân tộc.
    </p>
    <div class="su-divider"></div>
</section>

<!-- ================= FEATURE GRID ================= -->
<section class="su-features">
    <div class="su-features__inner">

        <div class="su-features__header reveal">
            <div class="su-section-eyebrow">Khám Phá</div>
            <h2 class="su-section-title">Chọn hành trình của bạn</h2>
            <p class="su-section-desc">Ba cánh cổng dẫn vào chiều sâu lịch sử Việt Nam</p>
        </div>

        <div class="su-feature-cards">

            <a href="${pageContext.request.contextPath}/characters" class="su-feature-card reveal reveal-delay-1">
                <div class="su-feature-card__icon-wrap">&#128100;</div>
                <h3 class="su-feature-card__title">Nhân Vật</h3>
                <p class="su-feature-card__desc">Khám phá những anh hùng, danh nhân và nhân vật định hình lịch sử Việt Nam qua từng thời kỳ.</p>
                <span class="su-feature-card__arrow">Khám phá &#8594;</span>
            </a>

            <a href="#" class="su-feature-card reveal reveal-delay-2">
                <div class="su-feature-card__icon-wrap">&#127983;</div>
                <h3 class="su-feature-card__title">Triều Đại</h3>
                <p class="su-feature-card__desc">Tìm hiểu sự hưng vong của các triều đại — từ Hùng Vương đến thời kỳ nhà Nguyễn và cận đại.</p>
                <span class="su-feature-card__arrow">Khám phá &#8594;</span>
            </a>

            <a href="${pageContext.request.contextPath}/timeline" class="su-feature-card reveal reveal-delay-3">
                <div class="su-feature-card__icon-wrap">&#128220;</div>
                <h3 class="su-feature-card__title">Sự Kiện</h3>
                <p class="su-feature-card__desc">Theo dõi các cột mốc lịch sử quan trọng theo dòng thời gian — từ dựng nước đến giải phóng dân tộc.</p>
                <span class="su-feature-card__arrow">Khám phá &#8594;</span>
            </a>

        </div>
    </div>
</section>

<!-- ================= TOP 6 NHÂN VẬT ================= -->
<section id="featured" class="su-characters">
    <div class="su-characters__inner">

        <div class="su-characters__header reveal">
            <div class="su-section-eyebrow">Nhân Vật Tiêu Biểu</div>
            <h2 class="su-section-title">Những huyền thoại lịch sử</h2>
            <p class="su-section-desc">Theo dòng thời gian lịch sử Việt Nam — những con người làm rạng danh non sông</p>
            <div class="su-divider" style="background: linear-gradient(90deg, var(--color-gold), rgba(212,160,23,0.2));"></div>
        </div>

        <div class="su-character-grid">

            <c:forEach items="${top6}" var="c">

                <div class="su-character-card reveal">

                    <div class="su-character-card__img-wrap">
                        <img src="${pageContext.request.contextPath}/assets/images/characters/${c.image}"
                             class="su-character-card__img"
                             alt="${c.name}">
                        <div class="su-character-card__gradient"></div>
                    </div>

                    <div class="su-character-card__body">
                        <span class="su-character-card__dynasty">${c.dynasty}</span>
                        <h3 class="su-character-card__name">${c.name}</h3>
                        <p class="su-character-card__desc">${c.description}</p>
                        <a href="${pageContext.request.contextPath}/characters?id=${c.id}"
                           class="su-character-card__cta">
                            Xem Chi Tiết &#8594;
                        </a>
                    </div>

                </div>

            </c:forEach>

        </div>

        <div class="su-characters__more reveal">
            <a href="${pageContext.request.contextPath}/characters" class="btn-outline-gold">
                Xem tất cả nhân vật &nbsp;&#8594;
            </a>
        </div>

    </div>
</section>

<jsp:include page="/common/footer.jsp"/>

<!-- ================= AI CHAT ================= -->
<button class="ai-button" onclick="document.getElementById('aiBox').classList.toggle('hidden')">
    &#129302; AI Trợ Lý
</button>

<div class="ai-chat-box hidden" id="aiBox">
    <div class="ai-header">
        <span>&#129302; Trợ Lý Sử Học</span>
        <button onclick="document.getElementById('aiBox').classList.add('hidden')">&times;</button>
    </div>
    <div class="ai-messages" id="aiMessages">
        <div class="ai-msg bot">Xin chào! Tôi là trợ lý Sử Môn. Bạn muốn tìm hiểu về nhân vật hay sự kiện lịch sử nào?</div>
    </div>
    <div class="ai-input">
        <input type="text" id="aiInput" placeholder="Hỏi về lịch sử Việt Nam..." onkeydown="if(event.key==='Enter') sendAI()">
        <button onclick="sendAI()">Gửi</button>
    </div>
</div>

<!-- ================= SCRIPTS ================= -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

<script>
// Scroll reveal
(function () {
    var els = document.querySelectorAll('.reveal');
    var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.12 });
    els.forEach(function (el) { observer.observe(el); });
})();

// AI Chat
function sendAI() {
    var input = document.getElementById('aiInput');
    var msg = input.value.trim();
    if (!msg) return;

    var messages = document.getElementById('aiMessages');
    var userDiv = document.createElement('div');
    userDiv.className = 'ai-msg user';
    userDiv.textContent = msg;
    messages.appendChild(userDiv);
    input.value = '';
    messages.scrollTop = messages.scrollHeight;

    var typingDiv = document.createElement('div');
    typingDiv.className = 'ai-msg bot';
    typingDiv.textContent = '...';
    messages.appendChild(typingDiv);
    messages.scrollTop = messages.scrollHeight;

    fetch('https://api.anthropic.com/v1/messages', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            model: 'claude-sonnet-4-6',
            max_tokens: 1000,
            system: 'Bạn là trợ lý lịch sử Việt Nam của nền tảng Sử Môn. Trả lời ngắn gọn, chính xác và bằng tiếng Việt.',
            messages: [{ role: 'user', content: msg }]
        })
    })
    .then(function (r) { return r.json(); })
    .then(function (data) {
        typingDiv.textContent = (data.content && data.content[0] && data.content[0].text)
            ? data.content[0].text
            : 'Xin lỗi, tôi chưa thể trả lời câu hỏi này.';
        messages.scrollTop = messages.scrollHeight;
    })
    .catch(function () {
        typingDiv.textContent = 'Lỗi kết nối. Vui lòng thử lại.';
    });
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
