# Long Document RAG with Conversational Memory

![learnwithparam.com](https://www.learnwithparam.com/ai-bootcamp/opengraph-image)

Turn any long PDF into an AI tutor you can have a conversation with. Parse the document with Docling, chunk it with a recursive text splitter, embed it with HuggingFace sentence transformers, store vectors in FAISS, and wire a `ConversationalRetrievalChain` that remembers the whole chat.

> Start learning at [learnwithparam.com](https://learnwithparam.com). Regional pricing available with discounts of up to 60%.

## What You'll Learn

- Parse long PDFs with Docling, including OCR and table structure detection
- Chunk content with `RecursiveCharacterTextSplitter` while preserving chapter context
- Generate free local embeddings with HuggingFace sentence transformers
- Persist and reload a FAISS vector store for fast repeated queries
- Build a `ConversationalRetrievalChain` that follows up on previous turns
- Write a prompt template that grounds answers strictly in retrieved chunks

## Tech Stack

- **Python 3.11+** with `uv` for dependency management
- **Docling** for layout-aware PDF parsing with OCR and tables
- **LangChain** + `ConversationalRetrievalChain` for memory-aware retrieval
- **FAISS** for fast in-memory vector search
- **HuggingFace Sentence Transformers** for local embeddings
- **OpenAI** via `langchain-openai` for the chat LLM

## Getting Started

### Prerequisites

- Python 3.11+
- [uv](https://docs.astral.sh/uv/) (installed automatically by `make setup`)
- An OpenAI API key

### Quick Start

```bash
make dev

# Or step by step:
make setup
# Edit .env with your OPENAI_API_KEY
make run
```

Point the loader at your own PDF and start asking questions. The chain remembers the conversation across turns.

### With Docker

```bash
make build
make up
make logs
make down
```

## Challenges

Work through these incrementally to build the tutor:

1. **PDF Loading** - Wrap Docling in a `BaseLoader` that yields one chunked document per section
2. **Text Splitting** - Configure `RecursiveCharacterTextSplitter` for long-form prose
3. **Embeddings** - Load a HuggingFace embedding model with sensible batch sizes
4. **FAISS Index** - Build and persist the vector store so restarts are instant
5. **Prompt Template** - Write a retrieval prompt that cites chapters and refuses to hallucinate
6. **Conversational Chain** - Assemble `ConversationalRetrievalChain` with memory and a custom prompt
7. **Source Citations** - Return the chunks that grounded each answer with page numbers
8. **Interactive Loop** - Wrap the chain in a REPL that lets the user ask follow-up questions

## Makefile Targets

```
make help           Show all available commands
make setup          Initial setup (create .env, install deps)
make dev            Setup and run (one command!)
make run            Run the conversational PDF tutor
make build          Build Docker image
make up             Start container
make down           Stop container
make clean          Remove venv and caches
```

## Learn more

- Start the course: [learnwithparam.com/courses/conversational-pdf-rag](https://www.learnwithparam.com/courses/conversational-pdf-rag)
- AI Bootcamp for Software Engineers: [learnwithparam.com/ai-bootcamp](https://www.learnwithparam.com/ai-bootcamp)
- All courses: [learnwithparam.com/courses](https://www.learnwithparam.com/courses)
